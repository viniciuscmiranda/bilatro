/// @return {Struct}
/// @description Returns { [key: Enum.POKER_HAND_RULES]: Real }
function build_poker_hand_rules(){
	var _rules = {}
	_rules[$ POKER_HAND_RULES.HIGH_CARD_MIN] = 1
	_rules[$ POKER_HAND_RULES.PAIR_MIN] = 2
	_rules[$ POKER_HAND_RULES.THREE_OF_A_KIND_MIN] = 3
	_rules[$ POKER_HAND_RULES.FOUR_OF_A_KIND_MIN] = 4
	_rules[$ POKER_HAND_RULES.FIVE_OF_A_KIND_MIN] = 5
	_rules[$ POKER_HAND_RULES.FLUSH_MIN] = 5
	_rules[$ POKER_HAND_RULES.STRAIGHT_MIN] = 5
	_rules[$ POKER_HAND_RULES.STRAIGHT_GAP] = 0

	return _rules
}