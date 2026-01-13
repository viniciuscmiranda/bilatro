event_inherited()

var _radius = RADIUS_4
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// draw score boxes
draw_box_shadow(x1, chips_y1, x2, chips_y2, COLOR_CHIPS, _radius, _radius)
draw_box_shadow(x1, mult_y1, x2, mult_y2, COLOR_MULT, _radius, _radius)

draw_reset()

// draw "x" on center
draw_setup_text(fa_center, fa_middle)
draw_text_shadow(x, chips_y2 + gap / 2, "X")

draw_reset()