subscribers = {}

/// @param {Id.Instance} _id
/// @param {Enum.EVENTS} _event
/// @param {Function} _callback
function subscribe(_id, _event, _callback) {
	if not (variable_struct_exists(subscribers, _event)) {
		subscribers[$ _event] = []
	} else {
		var _event_subs = subscribers[$ _event]
		
		for(var i=0; i < array_length(_event_subs); i++) {
			var _sub = _event_subs[i][0]
			if (_sub == _id) return
		}
	}
	
	array_insert(subscribers[$ _event], 0, [_id, _callback])
}


/// @param {Id.Instance} _id
/// @param {Enum.EVENTS} _event
/// @param {Any} [_data]
function publish(_id, _event, _data = undefined) {
	if not (struct_exists(subscribers, _event)) return;
	var _event_subs = subscribers[$ _event]
	
	for (var i=array_length(_event_subs) - 1; i >= 0; i--) {
		var _sub = _event_subs[i][0]
		var _callback = _event_subs[i][1]
			
		if not (instance_exists(_sub)) {
			array_delete(_event_subs, i, 1)
		} else {
			with (_sub) {
				_callback(_data)
			}
		}
	}
	
	if (array_length(_event_subs) < 0) {
		variable_struct_remove(subscribers, _event)
	}
}

/// @param {Id.Instance} _id
/// @param {Enum.EVENTS} _event
function unsubscribe(_id, _event) {
	if not (struct_exists(subscribers, _event)) return;
	var _event_subs = subscribers[$ _event]
		
	for(var i=array_length(_event_subs) - 1; i >= 0; i--) {
		var _sub = _event_subs[i][0]
		if (_sub == _id) array_delete(_event_subs, i, 1)
	}
	
	if (array_length(_event_subs) < 0) {
		variable_struct_remove(subscribers, _event)
	}
}

/// @param {Id.Instance} _id
function unsubscribe_all(_id) {
	var _events = struct_get_names(subscribers)
	
	for(var i=array_length(_events) - 1; i >= 0; i--) {
		var _event = _events[i]
		self.unsubscribe(_id, _event)
	} 
}