draw_self()
draw_setup_text(fa_center, fa_middle)

var _size = scale + base_text_size - (string_length(text) * text_size_per_character_decrease)
var _shadow_offset = (scale * SPACE_1 / 4)

// draws text
draw_text_shadow(
	x,
	y,
	text,
	_size,
	_size,
	0,
	c_white,
	-_shadow_offset, 
	_shadow_offset, 
	image_alpha
)

draw_reset()