/// @param {Enum.RANKS} [_rank]
function get_rank_chips(_rank) {
	switch(_rank) {
		case RANKS.HIGH_ACE:
		case RANKS.ACE:		return 11
		case RANKS._2:		return 2
		case RANKS._3:		return 3
		case RANKS._4:		return 4
		case RANKS._5:		return 5
		case RANKS._6:		return 6
		case RANKS._7:		return 7
		case RANKS._8:		return 8
		case RANKS._9:		return 9
		case RANKS._10:		return 10
		case RANKS.JACK:	return 10
		case RANKS.QUEEN:	return 10
		case RANKS.KING:	return 10
		default:			return 0
	}
}