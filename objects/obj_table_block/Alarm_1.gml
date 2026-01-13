/// @description Discard
if (array_length(cards) < 1) exit
var _card = array_shift(cards)
_card.go_away()

alarm_set(ALARMS.DISCARD, discard_delay)