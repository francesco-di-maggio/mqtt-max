// MQTT topic filters (MQTT 3.1.1, 4.7): "+" matches one level, "#" the rest, and wildcards
// at the first level do not match topics starting with "$".

function matches(filter, topic) {
  if (topic.startsWith("$") && /^[+#]/.test(filter)) return false;
  const f = filter.split("/");
  const t = topic.split("/");
  for (let i = 0; i < f.length; i++) {
    if (f[i] === "#") return true;
    if (i >= t.length) return false;
    if (f[i] !== "+" && f[i] !== t[i]) return false;
  }
  return f.length === t.length;
}

module.exports = { matches };
