/// @desc
event_inherited()

original_image_index = rank + (array_length(get_ranks_array()) * suit)
original_sprite_index = sprite_index
image_index = original_image_index

chips = get_rank_chips(rank)

// setup trigger
/// @description Init card scoring
function trigger() {
	trigger_init(function() {
		trigger_type = TRIGGER_TYPES.CHIPS
		trigger_value = chips
		global.round.chips += chips
	})
}

// flip animation setup
flip_sequence_id = noone
flip_sequence_inst = noone

/// @description Runs flip animation
function flip() {
	sprite_index = back_sprite_index
	image_index = back_image_index
	
	flip_sequence_id = layer_sequence_create("Sequences", x, y, seq_flip_card)
	flip_sequence_inst = layer_sequence_get_instance(flip_sequence_id)
	sequence_instance_override_object(flip_sequence_inst, obj_card, id)
	layer_sequence_speedscale(flip_sequence_id, global.animation_speed)
}