/// @desc

// setup constants
max_hand_size = 8
max_discards = 3
max_plays = 4
max_jokers = 5
ante_count = global.initial_ante
round_count = global.initial_round
blind = get_blinds_array()[0]

// init rules
poker_hand_rules = {}
ante_base_scores = [
	100,
	300,
	900,
	2_600,
	8_000,
	2_0000,
	36_000,
	60_000,
	100_000
]

// init poker hands
poker_hands_levels = array_map(
	get_poker_hands_array(),
	function () { return global.initial_poker_hands_level }
)

// init jokers
jokers = [
	new Joker(JOKERS.SPADES_JOKER),
	new Joker(JOKERS.DIAMONDS_JOKER),
	new Joker(JOKERS.JOKER)
]

// init deck
deck = []
var _suits = get_suits_array()
var _ranks = get_ranks_array()

for (var s = 0; s < array_length(_suits); s++) {
    for (var r = 0; r < array_length(_ranks); r++) {
		var _card = new Card(_suits[s], _ranks[r])
        array_push(deck, _card)
    }
}

// init round
// TODO: only init after start button is clicked
global.round = instance_create_depth(0, 0, 0, round_manager, {
	remaining_discards: max_discards,
	remaining_plays: max_plays,
	score_requirement: get_blind_score(blind, ante_count),
	hand_size: max_hand_size
})

// subscribers
subscribe(EVENTS.ROUND_END, _on_round_end)

function _on_round_end() {
	var _blinds = get_blinds_array()
	var _blinds_count = array_length(_blinds)
	
	// loops to first blind
	blind = (round_count - 1) % _blinds_count
	round_count++

	// increase ante count when getting back to first blind
	if (blind == _blinds[0]) {
		ante_count++
	}
}

// helpers
/// @param {Enum.POKER_HANDS} _poker_hand
function level_up_poker_hand(_poker_hand) {
	poker_hand_levels[_poker_hand]++
}

/// @param {Enum.POKER_HANDS} _poker_hand
/// @return {Struct}
/// @description Returns { chips: Real, mult: Real, level: Real }
function get_poker_hand_info(_poker_hand) {
	var _level = poker_hands_levels[_poker_hand]
	var _info = get_poker_hand_info(_poker_hand)
	
	var _chips_level = _info.chips_per_level * (_level - 1)
	var _chips = _info.base_chips + _chips_level
	
	var _mult_level = _info.mult_per_level * (_level - 1)
	var _mult = _info.base_mult + _mult_level
	
	return {
		chips: _chips,
		mult: _mult,
		level: _level,
	}
}

// helpers
/// @param {Enum.BLINDS} _blind
/// @param {Real} _ante
function get_blind_score(_blind, _ante) {
	var _base_score = get_ante_base_score(_ante)
	var _mult = get_blind_score_multiplier(_blind)
	
	return round(_base_score * _mult)
}

/// @param {Real} _ante
function get_ante_base_score(_ante) {
	var _max_ante =  array_length(ante_base_scores) - 1
	
	// subtracting because ante count starts at 1
	_ante = clamp(_ante - 1, 0, _max_ante)
	return ante_base_scores[_ante]
}
