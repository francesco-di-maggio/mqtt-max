// [js mqtt.queue.js] in [mqtt.client]: holds messages for the Node script, from the inlet and from the objects
// that share the client, until the script is ready. "script" messages bypass it.
// Left inlet: any message. Right inlet: any message opens the queue and sends what it holds, in order.
inlets = 2;
outlets = 1;

var open = false;
var held = [];

function anything() {
	var message = arrayfromargs(messagename, arguments);
	if (inlet === 1) return flush();
	if (open) outlet(0, message);
	else held.push(message);
}

function flush() {
	open = true;
	for (var i = 0; i < held.length; i++) outlet(0, held[i]);
	held = [];
}
