/// @param {Enum.JOKERS} [_joker]
/// @return {String}
function get_joker_name(_joker) {
	switch(_joker) {
		case JOKERS.JOKER:			return "Joker"
		case JOKERS.SPADES_JOKER:	return "Joker of Spades"
		case JOKERS.HEARTS_JOKER:	return "Joker of Hearts"
		case JOKERS.CLUBS_JOKER:	return "Joker of Clubs"
		case JOKERS.DIAMONDS_JOKER:	return "Joker of Diamonds"
		default:					return ""
	}
}