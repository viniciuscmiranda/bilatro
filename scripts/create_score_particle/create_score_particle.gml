/// @param {Enum.TRIGGER_TYPES} _trigger_type
function create_score_particle(_trigger_type, _trigger_value = "") {
	var _draw_on_bottom =
		bbox_top < sprite_get_height(spr_score_particle)
	
	var _y = _draw_on_bottom 
		? y + sprite_height / 2 + SPACE_2
		: y - sprite_height / 2 - SPACE_2
		
	instance_create_depth(
		x,
		_y,
		-100,
		obj_score_particle,
		{ trigger_type: _trigger_type, trigger_value: _trigger_value }
	)
}