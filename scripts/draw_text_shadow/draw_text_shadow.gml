/// @param {Real} _x
/// @param {Real} _y
/// @param {String} _string
/// @param {Real} [_xscale]
/// @param {Real} [_yscale]
/// @param {Real} [_angle]
/// @param {Constant.Color} [_color]
/// @param {Real} [_xoffset]
/// @param {Real} [_yoffset]
/// @param {Real} [_alpha]
function draw_text_shadow(
	_x,
	_y,
	_string,
	_xscale = 1,
	_yscale = 1,
	_angle = 0,
	_color = c_white,
	_xoffset = -SPACE_1 / 4,
	_yoffset = SPACE_1 / 4,
	_alpha = 1
) {
	draw_set_alpha(0.2 * _alpha)
	draw_set_colour(c_black)
	draw_text_transformed(_x + _xoffset, _y + _yoffset, _string, _xscale, _yscale, _angle)

	draw_set_alpha(_alpha)
	draw_set_colour(_color)
	draw_text_transformed(_x, _y, _string, _xscale, _yscale, _angle)
}