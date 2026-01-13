/// @param {Enum.BLINDS} [_blind]
function get_blind_label(_blind) {
	switch(_blind) {
		case BLINDS.SMALL_BLIND:	return "Small Blind"
		case BLINDS.BIG_BLIND:		return "Big Blind"
		case BLINDS.BOSS_BLIND:		return "Boss Blind"
		default:					return "Blind"
	}
}