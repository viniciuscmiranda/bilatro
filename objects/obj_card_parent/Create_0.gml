event_inherited()
ALARMS = { TRIGGER: 0 }

// float config
float_distance = 0.6 * sign(random_range(-1, 1))
float_timer = 0
float_delay = round(random(60))
prev_y = y

// tooltip config
tooltip_enable = true
tooltip_title = ""
tooltip_description = ""
tooltip_inst = noone

// trigger config
var _is_joker = object_index == obj_joker_parent or object_is_ancestor(object_index, obj_joker_parent)

trigger_type = -1
trigger_value = ""
trigger_count = 0
is_triggering = false
trigger_fail = false
last_triggered = noone
on_hold = false
trigger_callback = function() { }

TRIGGER_EVENT = _is_joker ? EVENTS.JOKER_TRIGGER : EVENTS.CARD_TRIGGER
TRIGGER_START_EVENT = _is_joker ? EVENTS.JOKER_TRIGGER_START : EVENTS.CARD_TRIGGER_START
TRIGGER_END_EVENT = _is_joker ? EVENTS.JOKER_TRIGGER_END : EVENTS.CARD_TRIGGER_END

// sequences config
sequence_id = noone
sequence_inst = noone

// subscribers
init_subscribers()
function init_subscribers() {
	subscribe(EVENTS.JOKER_TRIGGER_START, _on_card_trigger_start)
	subscribe(EVENTS.CARD_TRIGGER_START, _on_card_trigger_start)
	subscribe(EVENTS.JOKER_TRIGGER_END, _on_card_trigger_end)
	subscribe(EVENTS.CARD_TRIGGER_END, _on_card_trigger_end)
	subscribe(EVENTS.PLAY_HAND, _on_play_hand)
	subscribe(EVENTS.JOKERS_END, _on_jokers_end)
}

/// @param {Id.Instance.obj_card} _card
function _on_card_trigger_start(_card) {
	if (_card == id) return;
	last_triggered = _card
	on_hold = true
}

/// @param {Id.Instance.obj_card} _card
function _on_card_trigger_end(_card) {
	if (_card == id) return;
	var _should_trigger = trigger_fail and last_triggered == _card
	
	if (not trigger_fail or _should_trigger) {
		on_hold = false
		last_triggered = noone
	} 
	
	if (_should_trigger) trigger_init(trigger_callback)
}

function _on_play_hand() {
	is_disabled = true
}

function _on_jokers_end() {
	is_disabled = false
}

// helpers
/// @param {Function} _callback
function trigger_init(_callback) {
	trigger_callback = _callback
	
	if (on_hold) {
		trigger_fail = true
		return;
	}
	
	publish(TRIGGER_START_EVENT, id)

	trigger_fail = false
	is_triggering = true
	trigger_count++
	
	if (sequence_inst == noone) {
		sequence_id = layer_sequence_create("Sequences", x, y, seq_score_card)
		sequence_inst = layer_sequence_get_instance(sequence_id)
		sequence_instance_override_object(sequence_inst, obj_card, id)
		layer_sequence_speedscale(sequence_id, global.animation_speed)
		layer_sequence_pause(sequence_id)
	}
	
	alarm_start(ALARMS.TRIGGER)
}

function go_away() {
	target_scale = 0.5
	target_x = room_width + sprite_width
	target_y = room_height / 2 + random_range(-SPACE_4, SPACE_4)
}