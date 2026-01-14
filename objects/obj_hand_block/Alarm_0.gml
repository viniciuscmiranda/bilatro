/// @description Draw
if (array_length(drawing_cards) < 1) exit

var _card = array_shift(drawing_cards)
_card.flip()

// toggle card selection on click
_card.on_click = method(_card, function() {
	var _cards = global.round.hand.cards
	if not (array_contains(_cards, id)) return
	
	var _selected_cards = global.round.hand.selected_cards
	var _index = array_get_index(_selected_cards, id)
	
	// removes if already selected
	if (_index != -1) array_delete(_selected_cards, _index, 1)
	else array_push(_selected_cards, id)
	
	global.round.hand.sort_selected_cards()
	publish(EVENTS.SELECT_CARD, _selected_cards)
})

// sorts selected cards after card drag ends
_card.on_drag_end = method(_card, function() {
	global.round.hand.sort_selected_cards()
})

// sorts cards after new cards are drawn
array_push(cards, _card)
array_sort(cards, function (_a, _b) {
	return card_sorter(_a.data, _b.data)
})

alarm_set(ALARMS.DRAW, delay(draw_delay))