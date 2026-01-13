// setup constants
base_text_size = 1.6
text_size_per_character_decrease = 0.13
text = get_trigger_label(trigger_type, trigger_value)

max_angle_title = 15
base_angle = 45

scale_step = step(0.05)
max_scale = random_range(0.8, 0.9) 
scale = 0

alpha_step = step(0.2)
alpha_decrease = 0.015
destroy_at_alpha = 0.1
start_linear_alpha_at_scale = max_scale * 0.85
start_lerp_alpha_at_scale = max_scale * 0.75

// setup image
image_blend = get_trigger_color(trigger_type)
image_angle = base_angle + irandom_range(-max_angle_title, max_angle_title)

/// @param {Enum.TRIGGER_TYPES} [_trigger_type]
function get_trigger_color(_trigger_type) {
	switch(_trigger_type) {
		case TRIGGER_TYPES.CHIPS:		return COLOR_CHIPS
		case TRIGGER_TYPES.MULT:		return COLOR_MULT
		case TRIGGER_TYPES.TIMES_MULT:	return COLOR_MULT
		default:						return c_white
	}
}

/// @param {Enum.TRIGGER_TYPES} [_trigger_type]
/// @param {Real} [_trigger_value]
function get_trigger_label(_trigger_type, _trigger_value) {
	switch(_trigger_type) {
		case TRIGGER_TYPES.CHIPS:		return $"+{_trigger_value}"
		case TRIGGER_TYPES.MULT:		return $"+{_trigger_value} Mult"
		case TRIGGER_TYPES.TIMES_MULT:	return $"x{_trigger_value} Mult"
		default:						return _trigger_value
	}
}