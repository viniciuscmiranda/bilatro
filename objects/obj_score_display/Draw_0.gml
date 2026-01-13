// calcs shadow offset based on current scale
var _shadow_offset = scale * SPACE_1 / 4

// draw value
draw_setup_text(fa_center, fa_middle)
draw_set_font(fnt_big)
draw_text_shadow(
	x,
	// aligns a bit to the bottom
	y + SPACE_1 / 4,
	// always draw round numbers
	round(curr_value),
	scale,
	scale,
	angle,
	c_white,
	- _shadow_offset,
	// generates different values for offset Y when scale gets high
	SPACE_1 / 4 + _shadow_offset
)

draw_reset()