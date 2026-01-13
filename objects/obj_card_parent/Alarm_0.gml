/// @description Trigger
var _trigger_delay = 15
var _sequence_time_left_on_trigger = 10

// checks if sequence is finished before actually triggering
if not (sequence_inst.finished or sequence_inst.paused) {
	var _total = layer_sequence_get_length(sequence_id)
    var _current = layer_sequence_get_headpos(sequence_id)
    var _left = _total - _current
	
	if (_left > _sequence_time_left_on_trigger) {
		alarm_start(ALARMS.TRIGGER)
		exit
	}
}

// finishes if no triggers are left
if (trigger_count <= 0) {
	layer_sequence_destroy(sequence_id)
	sequence_id = noone
	sequence_inst = noone

	is_triggering = false
	
	publish(TRIGGER_END_EVENT, id)
	exit
}

// restarts sequence when triggering
layer_sequence_headpos(sequence_id, 0)
layer_sequence_play(sequence_id)

trigger_callback()
trigger_count--

publish(TRIGGER_EVENT, id)

create_score_particle(trigger_type, trigger_value)

// restarts
alarm_set(ALARMS.TRIGGER, delay(_trigger_delay))
