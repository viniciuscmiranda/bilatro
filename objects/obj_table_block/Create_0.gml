ALARMS = { SCORE: 0, DISCARD: 1, END: 2 }

// setup cards
cards = []
scoring_cards = []

// subscribers
curr_card = noone
score_fail = false
last_joker = noone

start_score_delay = delay(30)
score_delay = delay(10)
start_discard_delay = delay(5)
discard_delay = delay(3)
end_delay = delay(5)

subscribe(EVENTS.PLAY_HAND, _on_play_hand)
subscribe(EVENTS.JOKERS_END, _on_jokers_end)
subscribe(EVENTS.JOKER_TRIGGER_START, _on_joker_trigger_start)
subscribe(EVENTS.JOKER_TRIGGER_END, _on_joker_trigger_end)
subscribe(EVENTS.CARD_TRIGGER_END, _on_card_trigger_end)

/// @param {Array<Id.Instance.obj_card>} _selected_cards
function _on_play_hand(_selected_cards) {
	// store played cards
	cards = _selected_cards
	
	var _card_structs = array_map(cards, function(_card) {
		return _card.data
	})
	
	// get scoring cards
	var _scoring_cards = get_poker_hand_scoring_cards(_card_structs, global.run.poker_hand_rules)
	
	// position cards on table
	var _count = array_length(cards)
	var _card_w = sprite_get_width(spr_cards)
	var _spacing = round(min(width / _count, _card_w + SPACE_2))
	var _total_w = (_count - 1) * _spacing
	var _start_x = round(x - (_total_w / 2))

	for (var i=0; i < _count; i++) {
		var _card = cards[i]
		// updates card index and position
		_card.index = i
		_card.target_y = y
		_card.target_x = _start_x + (i * _spacing)
		
		// make non scoring cards smaller
		if not (array_contains(_scoring_cards, _card_structs[i])) {
			_card.target_scale = 0.8
		}
	}
	
	// store scoring card instances
	for (var i=0; i < array_length(_scoring_cards); i ++) {
		var _struct = _scoring_cards[i]
		var _original_index = array_get_index(_card_structs, _struct)
		var _card_instance = cards[_original_index]
		array_push(scoring_cards, _card_instance)
	}
	
	// starts scoring
	alarm_set(ALARMS.SCORE, start_score_delay)
}

/// @param {Id.Instance.obj_card} _card
function _on_card_trigger_end(_card) {
	// if triggered card wasn't currently triggering card, ignores it
	if (curr_card and _card != curr_card) return;
	
	if (array_length(scoring_cards) > 0) {
		// if there are more cards start alarm to scores next card
		alarm_set(ALARMS.SCORE, score_delay)
	} else {
		// otherwise start end event
		alarm_set(ALARMS.END, end_delay)
	}
}

/// @param {Id.Instance.obj_joker_parent} _joker
function _on_joker_trigger_start(_joker) {
	// if not scoring, ignores
	if (alarm_get(ALARMS.SCORE) < 0) return;
	
	// otherwise stop scoring and set failing state
	score_fail = true
	last_joker = _joker // TODO: this might have to be moved before the return statement
	alarm_set(ALARMS.SCORE, -1)
}

/// @param {Id.Instance.obj_joker_parent} _joker
function _on_joker_trigger_end(_joker) {
	// if didn't fail or joker is not the last one triggered, ignores
	if (not score_fail or _joker != last_joker) return;
	
	// otherwise reset failing states and retry scoring
	score_fail = false
	last_joker = noone
	alarm_set(ALARMS.SCORE, score_delay)
}

function _on_jokers_end() {
	// cleanup after jokers finish scoring
	curr_card = noone
	scoring_cards = []
	alarm_set(ALARMS.DISCARD, start_discard_delay)
}