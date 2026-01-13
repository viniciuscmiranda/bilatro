/// @param {Enum.JOKERS} [_joker]
/// @return {Asset.GMObject}
function get_joker_object(_joker) {
	switch(_joker) {
		case JOKERS.JOKER:			return obj_joker_joker
		case JOKERS.SPADES_JOKER:	return obj_spades_joker
		case JOKERS.HEARTS_JOKER:	return obj_hearts_joker
		case JOKERS.CLUBS_JOKER:	return obj_clubs_joker
		case JOKERS.DIAMONDS_JOKER:	return obj_diamonds_joker
		default:					return undefined
	}
}