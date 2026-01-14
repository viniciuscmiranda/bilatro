// init constants
animation_speed_increase = 0.05

// setup
chips = 0
mult = 0
total_score = 0
is_win = false
is_lose = false
/// @type {Enum.POKER_HANDS}
poker_hand = undefined

// TODO: raise some components to run level
var _ui = init_round_ui()
deck = _ui.deck
hand = _ui.hand_block
score_block = _ui.score_block

var _play_btn = _ui.play_button
var _discard_btn = _ui.discard_button

// setup play button 
_play_btn.on_click = function() { 
	publish(EVENTS.PLAY_HAND, hand.selected_cards)
}
_play_btn.get_props = function() {
	return {
		label: "Play (" + string(remaining_plays) + ")",
		is_disabled: remaining_plays < 1 or array_length(hand.selected_cards) < 1
	}
}

// setup discard button 
_discard_btn.on_click = function() { 
	publish(EVENTS.DISCARD_HAND, hand.selected_cards)
}
_discard_btn.get_props = function() {
	return {
		label: "Discard (" + string(remaining_discards) + ")",
		is_disabled: remaining_discards < 1 or array_length(hand.selected_cards) < 1
	}
}

// subscribers
subscribe(EVENTS.SELECT_CARD, _on_select_card)
subscribe(EVENTS.PLAY_HAND, _on_play_hand)
subscribe(EVENTS.DISCARD_HAND, _on_discard_hand)
subscribe(EVENTS.JOKERS_END, _on_jokers_end)
subscribe(EVENTS.JOKER_TRIGGER_END, _on_card_trigger_end)
subscribe(EVENTS.CARD_TRIGGER_END, _on_card_trigger_end)

/// @param {Array<Id.Instance.obj_card>} _selected_cards
function _on_select_card(_selected_cards) {
	if (array_length(_selected_cards) < 1) {
		// resets if no card is selected
		poker_hand = undefined
		chips = 0
		mult = 0
		return;
	}
	
	// extracts struct from card instances
	var _card_structs = array_map(_selected_cards, function (_card) {
		return _card.data
	})
	
	// gets highest value matched hand
	var _matches = get_poker_hand_matches(_card_structs, global.run.poker_hand_rules)
	poker_hand = array_last(_matches)
	
	// updates valuse with poker hand info
	var _hand_info = global.run.get_poker_hand_info(poker_hand)
	chips = _hand_info.chips
	mult = _hand_info.mult
}

function _on_play_hand() {
	// decrease remaining plays immediately after hand is played
	remaining_plays--	
}

function _on_jokers_end() {
	// consolidates score after jokers scored
	total_score += chips * mult
	chips = 0
	mult = 0
	poker_hand = undefined
	
	// resets animation speed
	global.animation_speed = global.initial_animation_speed
	
	// checks for win or lose
	if (total_score >= score_requirement) {
		is_win = true
		publish(EVENTS.ROUND_WIN)
	} else if (remaining_plays <= 0) {
		is_lose = true
		publish(EVENTS.ROUND_LOSE)
	}
}

function _on_discard_hand() {
	// decrease remaning discards and reset values
	remaining_discards--
	chips = 0
	mult = 0
	poker_hand = undefined
}

function _on_card_trigger_end() {
	// increases animation speed after each trigger
	global.animation_speed = min(
		global.max_animation_speed,
		global.animation_speed + animation_speed_increase
	)
}

// helpers
function start() {
	publish(EVENTS.ROUND_START)
}