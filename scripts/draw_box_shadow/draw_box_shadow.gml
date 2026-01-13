/// @param {Real} _x1
/// @param {Real} _y1
/// @param {Real} _x2
/// @param {Real} _y2
/// @param {Constant.Color} [_color]
/// @param {Real} [_xrad]
/// @param {Real} [_yrad]
/// @param {Real} [_xoffset]
/// @param {Real} [_yoffset]
/// @param {Real} [_alpha]
function draw_box_shadow(
	_x1,
	_y1,
	_x2,
	_y2,
	_color = c_white,
	_xrad = 0,
	_yrad = 0,
	_xoffset = -SPACE_1 / 2,
	_yoffset = SPACE_1 / 2,
	_alpha = 1,
) {
	draw_set_alpha(0.2 * _alpha)
	draw_set_colour(c_black)
	draw_roundrect_ext(_x1 + _xoffset, _y1 + _yoffset, _x2 + _xoffset, _y2 + _yoffset, _xrad, _yrad, false)

	draw_set_alpha(_alpha)
	draw_set_colour(_color)
	draw_roundrect_ext(_x1, _y1, _x2, _y2, _xrad, _yrad, false)

}