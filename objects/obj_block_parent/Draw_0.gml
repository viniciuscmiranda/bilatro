var _x1 = x - width / 2
var _y1 = y - height / 2
var _x2 = x + width / 2
var _y2 = y + height / 2
var _rad = RADIUS_4

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_colour(color)
draw_set_alpha(alpha)
draw_roundrect_ext(_x1, _y1, _x2, _y2, _rad, _rad, false)
draw_reset()