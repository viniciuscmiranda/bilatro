/// @return {Array<Enum.RANKS>}
function get_ranks_array() {
	static _ranks = [
		RANKS.ACE,
		RANKS._2,
		RANKS._3,
		RANKS._4,
		RANKS._5,
		RANKS._6,
		RANKS._7,
		RANKS._8,
		RANKS._9,
		RANKS._10,
		RANKS.JACK,
		RANKS.QUEEN,
		RANKS.KING
	]
	
	return _ranks
}