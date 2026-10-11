// Topic filters with their owners, so that one owner unsubscribing never cuts off another.
// The broker sees each filter once, at the highest QoS any owner asked for.

const { matches } = require("./topic");

class Subscriptions {
  constructor(client) {
    this.client = client;
    this.filters = new Map();
  }

  qos(filter) {
    const owners = this.filters.get(filter);
    return owners ? Math.max(...owners.values()) : -1;
  }

  add(owner, filter, qos = 0) {
    const before = this.qos(filter);
    if (!this.filters.has(filter)) this.filters.set(filter, new Map());
    this.filters.get(filter).set(owner, qos);
    const after = this.qos(filter);
    if (after !== before) this.client.subscribe(filter, { qos: after });
  }

  remove(owner, filter) {
    const owners = this.filters.get(filter);
    if (!owners?.has(owner)) return;
    const before = this.qos(filter);
    owners.delete(owner);
    if (owners.size === 0) {
      this.filters.delete(filter);
      this.client.unsubscribe(filter);
      return;
    }
    const after = this.qos(filter);
    if (after !== before) this.client.subscribe(filter, { qos: after });
  }

  removeOwner(owner) {
    for (const filter of [...this.filters.keys()]) this.remove(owner, filter);
  }

  owns(owner, topic) {
    for (const [filter, owners] of this.filters) if (owners.has(owner) && matches(filter, topic)) return true;
    return false;
  }

  // After a new connection: the broker knows none of them.
  restore() {
    for (const filter of this.filters.keys()) this.client.subscribe(filter, { qos: this.qos(filter) });
  }
}

module.exports = { Subscriptions };
