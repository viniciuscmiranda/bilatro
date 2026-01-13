/// @param {Real} [_offset]
function draw_shadow(_offset = SPACE_1 / 2) {
	draw_sprite_ext(
		sprite_index,
		image_index, 
		x - _offset, 
		y + _offset, 
		image_xscale, 
		image_yscale,
		image_angle,
		c_black,
		0.3
	)
}