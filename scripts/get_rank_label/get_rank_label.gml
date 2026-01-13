/// @param {Enum.RANKS} [_rank]
function get_rank_label(_rank) {
	switch(_rank) {
		case RANKS.HIGH_ACE:
		case RANKS.ACE:		return "Ace"
		case RANKS._2:		return "Two"
		case RANKS._3:		return "Three"
		case RANKS._4:		return "Four"
		case RANKS._5:		return "Five"
		case RANKS._6:		return "Six"
		case RANKS._7:		return "Seven"
		case RANKS._8:		return "Eight"
		case RANKS._9:		return "Nine"
		case RANKS._10:		return "Ten"
		case RANKS.JACK:	return "Jack"
		case RANKS.QUEEN:	return "Queen"
		case RANKS.KING:	return "King"
		default:			return ""
	}
}