event_inherited()

var _max_target_dist_for_tooltip = 5 
var _max_target_dist_for_float = 10
var _float_lerp_base = 1.65
var _float_lerp_scale = 0.03
var _min_float_delay = 15
var _max_float_delay = 20

var _target_dist = max(abs(x - target_x), abs(y - target_y))

// creates tooltip
if (tooltip_enable and is_hovered and tooltip_inst == noone and _target_dist < _max_target_dist_for_tooltip) {
	tooltip_inst = create_tooltip(tooltip_title, tooltip_description)
} 

// destroys tooltip
if (not is_hovered and tooltip_inst != noone) {
	tooltip_inst.destroy()
	tooltip_inst = noone
}

// stop floating
if (is_hovered or is_dragging or _target_dist > _max_target_dist_for_float) {
	prev_y = y
	float_delay = 0
	exit
}

// holds on y position while on float delay
if (float_delay > 0) {
	y = prev_y
	float_delay--
	exit
}

// starts floating
float_timer = lerp(float_timer, float_distance * _float_lerp_base, _float_lerp_scale)

if (abs(float_timer) > abs(float_distance)) {
	float_distance *= -1
	float_delay = round(irandom_range(_min_float_delay, _max_float_delay))
} 

y += float_timer
prev_y = y
