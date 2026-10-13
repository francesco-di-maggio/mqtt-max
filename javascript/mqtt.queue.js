// [js mqtt.queue.js] in [mqtt.client]: holds messages from the inlet until the Node script is ready.
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
