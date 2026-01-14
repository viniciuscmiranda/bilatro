/// @param {Array<Struct.Card>} _cards
/// @param {Struct} _rules
/// @param {Bool} [_include_duplicates] Keeps cards with duplicated ranks in the same Straight
/// @return {Array<Struct.Card>}
/// @description 
/// Returns a filtered list of cards that could be used to form the longest Straight hand
/// In case of multiple Straights with the same amount of cards were found, the ones made with lower rank cards will be returned
function get_longest_straight(_cards, _rules, _include_duplicates = false) {
	/// @type {Array<Struct.Card>}
	var _cards_by_rank = array_to_sorted(_cards, function(_a, _b) {
		return _a.rank - _b.rank
	})
	
	var _straights = [[]]
	var _wrapped_cards = []
		
	for (var i=0; i < array_length(_cards_by_rank); i++) {
		var _card = _cards_by_rank[i]
		var _first_card = _cards_by_rank[0]
		var _is_first = i == 0
		var _is_last = _card == array_last(_cards_by_rank)

		
		// first card forms a straight by default
		if (_is_first) {
			array_push(array_last(_straights), _card)
		} else if (_is_last and _first_card.rank == RANKS.ACE) {
			var _card_rank = _card.rank 
			var _next_card_rank = RANKS.HIGH_ACE
			
			if (_card_rank  == RANKS.ACE) {
				if not (_include_duplicates) continue
				_card_rank  = RANKS.HIGH_ACE
			}

			var _expected_next_rank = _card_rank + 1
			var _next_to_expected_diff = _next_card_rank - _expected_next_rank

			if (
				_next_to_expected_diff <= _rules[$ POKER_HAND_RULES.STRAIGHT_GAP]
				and not array_contains(_wrapped_cards, _first_card)
			) {
				array_shift(_cards_by_rank)
				array_push(_cards_by_rank, _first_card)
				array_push(_wrapped_cards, _first_card)
				
				i--
				_is_last = false
			}
		} 
		
		if not (_is_last) {
			var _next_card = _cards_by_rank[i + 1]
			
			if (_next_card.rank == _card.rank and not _include_duplicates) {
				continue
			}
			
			var _expected_next_rank = _card.rank + 1
			var _next_to_expected_diff = _next_card.rank - _expected_next_rank

			// if next card is not valid creates a new straight
			if (_next_to_expected_diff > _rules[$ POKER_HAND_RULES.STRAIGHT_GAP]) {
				array_push(_straights, [])
			} 
			
			// either way pushes the next card to the last straight
			array_push(array_last(_straights), _next_card)
		}
	}
	
	// sort straights by length
	array_sort(_straights, function(_a, _b) {
		return array_length(_b) - array_length(_a)
	})
	
	var _longest_straight = _straights[0]
	return _longest_straight
}