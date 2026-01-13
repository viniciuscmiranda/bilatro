/// @param {Array<Struct.Card>} _cards
/// @param {Struct} [_rules]
/// @return {Array<Enum.POKER_HANDS>}
/// @description 
/// Returns a list of matching POKER_HANDS sorted by enum order
function get_poker_hand_matches(_cards, _rules = global.poker_hand_rules) {
	if (array_length(_cards) < 1) return []
	_rules = struct_merge(_rules, global.poker_hand_rules)
	
	var _suits_by_count = array_group_count(_cards, function(_card) {
		return _card.suit
	})
	
	var _ranks_by_count = array_group_count(_cards, function(_card) {
		return _card.rank
	})
	
	var _top_suit = _suits_by_count[0]
	var _top_rank = _ranks_by_count[0]
	var _top2_rank = array_get_safe(_ranks_by_count, 1)
	
	var _matches = []
	var _is_flush = false
	var _is_straight = false
	
	// Flush
	if (_top_suit.count >= _rules.flush_cards) {
		array_push(_matches, POKER_HANDS.FLUSH)
		_is_flush = true
	}
	
	// High Card
	if (_top_rank.count >= _rules.high_card_cards) {
		array_push(_matches, POKER_HANDS.HIGH_CARD)
	}
	
	// Pair
	if (_top_rank.count >= _rules.pair_cards) {
		array_push(_matches, POKER_HANDS.PAIR)
		
		// Two Pairs
		if (_top2_rank and _top2_rank.count >= _rules.pair_cards) {
			array_push(_matches, POKER_HANDS.TWO_PAIRS)
		}
	}
	
	// Three of a Kind
	if (_top_rank.count >= _rules.three_of_a_kind_cards) {
		array_push(_matches, POKER_HANDS.THREE_OF_A_KIND)
		
		// Full House
		if (_top2_rank and _top2_rank.count >= _rules.pair_cards) {
			array_push(_matches, POKER_HANDS.FULL_HOUSE)
			
			// Flush House
			if (_is_flush) {
				array_push(_matches, POKER_HANDS.FLUSH_HOUSE)
			}
		}
	}
	
	// Four of a Kind
	if (_top_rank.count >= _rules.four_of_a_kind_cards) {
		array_push(_matches, POKER_HANDS.FOUR_OF_A_KIND)
	}
	
	// Five of a Kind
	if (_top_rank.count >= _rules.five_of_a_kind_cards) {
		array_push(_matches, POKER_HANDS.FIVE_OF_A_KIND)
		
		// Flush Five
		if (_is_flush) {
			array_push(_matches, POKER_HANDS.FLUSH_FIVE)
		}
	}
		
	// Straight
	if (array_length(get_longest_straight(_cards)) >= _rules.straight_cards) {
		array_push(_matches, POKER_HANDS.STRAIGHT)
		_is_straight = true
	}
	
	// Straight Flush
	if (_is_straight and _is_flush) {
		array_push(_matches, POKER_HANDS.STRAIGHT_FLUSH)
	}
	
	// sorts by enum order
	array_sort(_matches, true)
	
	return _matches
}