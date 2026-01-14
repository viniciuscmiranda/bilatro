event_inherited()

var _target_dist = max(abs(x - target_x), abs(y - target_y))

// creates tooltip
if (tooltip_enable and is_hovered and tooltip_inst == noone and _target_dist < max_target_dist_for_tooltip) {
	tooltip_inst = create_tooltip(tooltip_title, tooltip_description)
} 

// destroys tooltip
if (not is_hovered and tooltip_inst != noone) {
	tooltip_inst.destroy()
	tooltip_inst = noone
}

// stops floating
if (is_hovered or is_dragging or _target_dist > max_target_dist_for_float) {
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
float_timer = lerp(float_timer, float_distance * float_lerp_base, float_lerp_scale)

if (abs(float_timer) > abs(float_distance)) {
	float_distance *= -1
	float_delay = round(irandom_range(min_float_delay, max_float_delay))
} 

y += float_timer
prev_y = y
