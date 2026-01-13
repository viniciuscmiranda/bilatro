/// @description Trigger
if (array_length(triggering_jokers) < 1) exit

var _joker = array_shift(triggering_jokers)
_joker.trigger()
