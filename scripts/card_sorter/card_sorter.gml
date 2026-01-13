/// @param {Struct.Card} _card_a
/// @param {Struct.Card} _card_b
function card_sorter(_card_a, _card_b) {
	var _card_a_chips = get_rank_chips(_card_a.rank)
	var _card_b_chips = get_rank_chips(_card_b.rank)

	// sort by chips (desc)
	var _diff = _card_b_chips - _card_a_chips
	if (_diff != 0) return _diff

	// sort by rank (desc)
	_diff = _card_b.rank - _card_a.rank
	if (_diff != 0) return _diff

	// sort by suit (asc)
	return _card_a.suit - _card_b.suit
}