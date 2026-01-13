draw_shadow()
draw_self()

draw_setup_text()

// draw deck size
draw_text_shadow(
	x,
	bbox_bottom + SPACE_2,
	$"{array_length(cards)}/{array_length(global.run.deck)}"
)

draw_reset()