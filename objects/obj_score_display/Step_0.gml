if (prev_value != value) {
	// calcs intensity of movement based on distance from previous value
	var _intensity = prev_value == 0
		// if prev was 0, divides new value by default divider
		? ceil(value / default_value_divider)
		// otherwise divides value by prev and add more intensity based on how absolutely big the value is
		: ceil((value / prev_value) + value / value_divider)
		
	scale += clamp(_intensity, 0, max_scale_increase)
	angle += clamp(random_range(-_intensity, _intensity) * angle_multiplier, -max_angle_increase, max_angle_increase)
	prev_value = value
}

curr_value = lerp(curr_value, value, value_lerp_step )
scale = lerp(scale, init_scale, scale_lerp_step)
angle = lerp(angle, 0, angle_lerp_step)