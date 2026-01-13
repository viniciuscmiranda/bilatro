/// @param {Enum.EVENTS} _event
/// @param {Any} [_data]
function publish(_event, _data = undefined) {
	if not (instance_exists(pubsub_manager)) return;
	var _pubsub_manager = instance_find(pubsub_manager, 0)
	
	_pubsub_manager.publish(id, _event, _data)
}

/// @param {Enum.EVENTS} _event
/// @param {Function} _callback
function subscribe(_event, _callback) {
	if not (instance_exists(pubsub_manager)) return;
	var _pubsub_manager  = instance_find(pubsub_manager, 0)
	
	_pubsub_manager.subscribe(id, _event, _callback)
}

/// @param {Enum.EVENTS} _event
function unsubscribe(_event) {
	if not (instance_exists(pubsub_manager)) return;
	var _pubsub_manager = instance_find(pubsub_manager, 0)
	
	_pubsub_manager.unsubscribe(id, _event)
}

function unsubscribe_all() {
	if not (instance_exists(pubsub_manager)) return;
	var _pubsub_manager = instance_find(pubsub_manager, 0)
	
	_pubsub_manager.unsubscribe_all(id)
}