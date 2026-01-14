event_inherited()
ALARMS = { TRIGGER: 0, END: 1 }

trigger_delay = 10
end_delay = 5

// setup jokers
/// @type {Array<Id.Instance.obj_joker_parent>}
jokers = []
/// @type {Array<Id.Instance.obj_joker_parent>}
triggering_jokers = []

// init drag area props
items = jokers
// adding to the sprite width so jokers stay separate if possible
item_width = sprite_get_width(spr_jokers) + SPACE_2

// subscribers
on_hold = false
trigger_fail = false
last_joker = noone

subscribe(EVENTS.ROUND_START, _on_round_start)
subscribe(EVENTS.JOKER_TRIGGER_END, _on_joker_trigger_end)
subscribe(EVENTS.JOKER_TRIGGER_START, _on_joker_trigger_start)
subscribe(EVENTS.SCORE_END, _on_score_end)

function _on_round_start() {
	var _run_jokers = global.run.jokers

	// create joker objects from structs when round starts
	for (var i=0; i < array_length(_run_jokers); i++) {
		var _joker_data = _run_jokers[i]
		var _joker_instance = instance_create_depth(
			x,
			y,
			depth - 1,
			get_joker_object(_joker_data.type),
			{ type: _joker_data.type, data: _joker_data }
		)
		
		// jokers re-subscribe to all events after order changes so they trigger in order
		_joker_instance.on_drag_end = method(id, function() {
			for (var j=0; j < array_length(jokers); j++) {
				var _joker = jokers[j]
				_joker.reset_events()
			}
		})
		
		// insert joker into list
		array_push(jokers, _joker_instance)
	}
}

function _on_score_end() {
	// filter for jokers that must activate at end of scoring
	triggering_jokers = array_filter(jokers, function(_joker) {
		return not _joker.skip
	})
	
	// skips triggering if currently on hold
	if (on_hold) {
		trigger_fail = true
		return;
	}
	
	trigger_fail = false
	
	if (array_length(triggering_jokers) > 0) {
		// trigger jokers if any were found
		alarm_set(ALARMS.TRIGGER, delay(trigger_delay))
	} else {
		// otherwise finishes jokers event
		alarm_set(ALARMS.END, delay(end_delay))
	} 
}

/// @param {Id.Instance.obj_joker_parent} _joker
function _on_joker_trigger_start(_joker) {
	// ignores if jokers is the type that triggers at the end of scoring
	if not (_joker.skip) return;
	
	if (alarm_running(ALARMS.TRIGGER)) {
		// if in middle of trigger event stop and set to failed
		trigger_fail = true
		alarm_set(ALARMS.TRIGGER, -1)
	}

	// set state to on hold and stores triggered joker
	on_hold = true
	last_joker = _joker
}

/// @param {Id.Instance.obj_joker_parent} _joker
function _on_joker_trigger_end(_joker) {
	if (on_hold and not trigger_fail) {
		// if trigger did not fail simply changes on hold back to false
		on_hold = false
	}
	
	// if trigger did fail and it's a joker that triggers on it's own...
	if (not _joker.skip or (last_joker == _joker and trigger_fail)) {
		// reset states
		on_hold = false
		last_joker = noone
		trigger_fail = false
		
		if (array_length(triggering_jokers) > 0) {
			// retry trigger if there's any jokers
			alarm_set(ALARMS.TRIGGER, delay(trigger_delay))
		} else {
			// otherwise just end
			alarm_set(ALARMS.END, delay(end_delay))
		} 
	}
}