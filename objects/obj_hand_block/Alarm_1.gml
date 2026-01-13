/// @description Discard
var _discard_delay = delay(3)

if (array_length(discarding_cards) < 1) {
	is_disabled = false
	publish(EVENTS.DISCARD_END)
	exit
}

var _card = array_shift(discarding_cards)

_card.go_away()
publish(EVENTS.DISCARD_CARD, _card)

alarm_set(ALARMS.DISCARD, _discard_delay)