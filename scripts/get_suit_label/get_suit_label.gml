/// @param {Enum.SUITS} [_suit]
/// @return {String}
function get_suit_label(_suit) {
	switch(_suit) {
		case SUITS.SPADES:		return "Spades"
		case SUITS.HEARTS:		return "Hearts"
		case SUITS.CLUBS:		return "Clubs"
		case SUITS.DIAMONDS:	return "Diamonds"
		default:				return ""
	}
}