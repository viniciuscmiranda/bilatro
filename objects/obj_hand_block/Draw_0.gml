event_inherited()

// draw hand size
draw_setup_text(fa_right)
draw_text_shadow(
	x + width / 2,
	y + height / 2 + SPACE_2,
	$"{array_length(cards)}/{global.run.max_hand_size}"
)

// draw poker hand
var _poker_hand = global.round.poker_hand
if not (is_nan(_poker_hand)) {
	var _hand_info = global.run.get_poker_hand_info(_poker_hand)

	draw_set_halign(fa_left)
	draw_text_shadow(
		x - width / 2,
		y + height / 2 + SPACE_2,
		$"{get_poker_hand_label(_poker_hand)} lv.{string(_hand_info.level)}"
	)
}

draw_reset()