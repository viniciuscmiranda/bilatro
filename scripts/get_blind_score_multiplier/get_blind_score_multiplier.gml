/// @param {Enum.BLINDS} [_blind]
function get_blind_score_multiplier(_blind) {
	switch(_blind) {
		case BLINDS.SMALL_BLIND:	return 1
		case BLINDS.BIG_BLIND:		return 1.5
		case BLINDS.BOSS_BLIND:		return 2
		default:					return 1
	}
}