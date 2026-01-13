/// @param {Enum.SUITS} [_suit]
function get_suit_color(_suit) {
	switch(_suit) {
		case SUITS.SPADES:		return COLOR_SPADES
		case SUITS.HEARTS:		return COLOR_HEARTS
		case SUITS.CLUBS:		return COLOR_CLUBS
		case SUITS.DIAMONDS:	return COLOR_DIAMONDS
		default:				return c_white
	}
}