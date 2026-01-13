event_inherited()

// draw joker count
draw_setup_text(fa_right)
draw_text_shadow(
	x + width / 2,
	y + height / 2 + SPACE_2,
	$"{array_length(jokers)}/{(global.run.max_jokers)}"
)

// draw current blind
draw_set_halign(fa_left)
draw_text_shadow(
	x - width / 2,
	y + height / 2 + SPACE_2,
	get_blind_label(global.run.blind)
)

draw_reset()