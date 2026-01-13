/// @return {Array<Enum.SUITS>}
function get_suits_array() {
	static _suits = [
		SUITS.SPADES,
		SUITS.HEARTS,
		SUITS.CLUBS,
		SUITS.DIAMONDS,
	]
	
	return _suits
}
