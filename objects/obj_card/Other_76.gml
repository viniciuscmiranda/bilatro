/// @description Flip animation

var _msg = event_data[? "message"]
var _element_id = event_data[? "element_id"]

// ignores event if flip animation does not belong to this card
if (layer_sequence_get_instance(_element_id) != flip_sequence_inst) {
	exit
}

switch (_msg) {
	// changes sprite when flip happens
    case "card_flip":
		sprite_index = original_sprite_index
		image_index = original_image_index
	    break
		
	// destroys sequence when animation ends
	case "card_flip_end":
		layer_sequence_destroy(flip_sequence_id)
		flip_sequence_id = noone
		flip_sequence_inst = noone
}