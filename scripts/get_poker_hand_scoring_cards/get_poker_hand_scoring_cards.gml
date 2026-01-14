/// @param {Array<Struct.Card>} _cards
/// @param {Struct} _rules
/// @return {Array<Struct.Card>}
/// @description Returns a list of scoring cards for current poker hand
function get_poker_hand_scoring_cards(_cards, _rules) {
	if (array_length(_cards) < 1) return []
	
	var _matches = get_poker_hand_matches(_cards, _rules)
	var _poker_hand = array_last(_matches)
	
	var _suits_by_count = array_group_count(_cards, function(_card) {
		return _card.suit
	})
	
	var _ranks_by_count = array_group_count(_cards, function(_card) {
		return _card.rank
	})
	
	var _cards_by_chips = array_to_sorted(_cards, function(_a, _b) {
		var _a_chips = get_rank_chips(_a.rank)
		var _b_chips = get_rank_chips(_b.rank)
		
		var _diff = _b_chips - _a_chips
		if (_diff == 0) _diff = _b.rank - _a.rank
		
		return _diff
	})
	
	var _top_suit = _suits_by_count[0]
	var _top_rank = _ranks_by_count[0]
	var _top2_rank = array_get_safe(_ranks_by_count, 1)
	var _high_rank = _cards_by_chips[0].rank
	var _longest_straight = get_longest_straight(_cards, _rules, true)
	
	var _scoring_cards = [] 
	
	for (var i=0; i < array_length(_cards); i++) {
		var _card = _cards[i]
		var _is_scoring = false
		
		switch (_poker_hand) {
			case POKER_HANDS.HIGH_CARD:
				// it's a scoring card if it's the higher rank card
				_is_scoring = _card.rank == _high_rank
				break
			case POKER_HANDS.PAIR:
			case POKER_HANDS.THREE_OF_A_KIND:
			case POKER_HANDS.FOUR_OF_A_KIND:
			case POKER_HANDS.FIVE_OF_A_KIND:
			case POKER_HANDS.FLUSH_FIVE:
				// it's a scoring card if it has the most repeated rank
				_is_scoring = _card.rank == _top_rank.key
				break
			case POKER_HANDS.FLUSH:
				// it's a scoring card if it has the most repeated suit
				_is_scoring = _card.suit == _top_suit.key
				break
			case POKER_HANDS.TWO_PAIRS:
			case POKER_HANDS.FULL_HOUSE:
			case POKER_HANDS.FLUSH_HOUSE:
				// it's a scoring card if it has the first or second most repeated ranks
				_is_scoring =  
					_card.rank == _top_rank.key
					or (_top2_rank and _card.rank == _top2_rank.key)
					
				break
			case POKER_HANDS.STRAIGHT:
				// it's a scoring card if it's part of the longest straight
				_is_scoring = array_contains(_longest_straight, _card)
				break
			case POKER_HANDS.STRAIGHT_FLUSH:
				// it's a scoring card if it has the most repeated suit or is part of the longest straight
				_is_scoring = 
					_card.suit == _top_suit.key
					or array_contains(_longest_straight, _card)
				break
			default:
				_is_scoring = false
				break
		}
			
		if (_is_scoring) array_push(_scoring_cards, _card)
	}
	
	return _scoring_cards
}