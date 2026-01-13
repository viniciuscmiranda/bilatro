/// @param {Enum.POKER_HANDS} [_poker_hand]
function get_poker_hand_label(_poker_hand) {
	switch(_poker_hand) {
		case POKER_HANDS.HIGH_CARD:			return "High Card"
		case POKER_HANDS.PAIR:				return "Pair"
		case POKER_HANDS.TWO_PAIRS:			return "Two Pairs"
		case POKER_HANDS.THREE_OF_A_KIND:	return "Three of a Kind"
		case POKER_HANDS.STRAIGHT:			return "Straight"
		case POKER_HANDS.FLUSH:				return "Flush"
		case POKER_HANDS.FULL_HOUSE:		return "Full House"
		case POKER_HANDS.FOUR_OF_A_KIND:	return "Four of a Kind"
		case POKER_HANDS.STRAIGHT_FLUSH:	return "Straight Flush"
		case POKER_HANDS.FIVE_OF_A_KIND:	return "Five of a Kind"
		case POKER_HANDS.FLUSH_HOUSE:		return "Flush House"
		case POKER_HANDS.FLUSH_FIVE:		return "Flush Five"
		default:							return ""
	}
}