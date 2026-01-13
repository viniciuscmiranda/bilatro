is_disabled = 
	not global.round.hand.can_select_cards()
	and not global.round.hand.is_card_selected(id)

// inherits after setting disable to avoid conflicts
event_inherited()

// keeps data updated in case it changes
chips = get_rank_chips(rank)
tooltip_title = $"{string(get_rank_label(rank))} of {string(get_suit_label(suit))}"
tooltip_description = [
	{ color: COLOR_CHIPS, text: $"+{chips}" },
	" Chips"
]
