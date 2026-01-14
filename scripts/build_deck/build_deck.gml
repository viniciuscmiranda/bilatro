/// @return {Array<Struct.Card>}
function build_deck() {
	var _deck = []
	var _suits = get_suits_array()
	var _ranks = get_ranks_array()

	for (var s = 0; s < array_length(_suits); s++) {
	    for (var r = 0; r < array_length(_ranks); r++) {
			var _card = new Card(_suits[s], _ranks[r])
	        array_push(_deck, _card)
	    }
	}
	
	return _deck
}