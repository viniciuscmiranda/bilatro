/// @return {Array<Enum.BLINDS>}
function get_blinds_array() {
	static _blinds = [
		BLINDS.SMALL_BLIND,
		BLINDS.BIG_BLIND,
		BLINDS.BOSS_BLIND
	]
	
	return _blinds
}