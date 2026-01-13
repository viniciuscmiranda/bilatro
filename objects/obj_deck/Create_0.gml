event_inherited()
ALARMS = { DRAW: 0 }

// setup
cards = []
draw_delay_after_score = delay(15)
draw_delay_after_discard = delay(5)

// subscribers
subscribe(EVENTS.JOKERS_END, _on_jokers_end)
subscribe(EVENTS.DISCARD_END, _on_discard_end)
subscribe(EVENTS.ROUND_START, _on_round_start)

function _on_jokers_end() {
	alarm_set(ALARMS.DRAW, draw_delay_after_score)
}

function _on_discard_end() {
	alarm_set(ALARMS.DRAW, draw_delay_after_discard)
}

function _on_round_start() {
	array_extend(cards, global.run.deck, true)
	array_shuffle_ext(cards)
	
	// draw initial cards
	draw_cards(global.run.max_hand_size)
}

// helpers
/// @param {Real} _amount
function draw_cards(_amount) {
	var _drawn_cards = []
	
	for (var i = 0; i < _amount; i++) {
		// stops if there are no cards remaining
		if (array_length(cards) < 0) break;

		// removes top card
		var _card = array_shift(cards)
		// create card instance on top of the deck object
		var _card_instance = instance_create_depth(x, y, 0, obj_card, {
			suit: _card.suit,
			rank: _card.rank,
			// set it's back image to the deck sprite
			back_sprite_index: sprite_index,
			back_image_index: image_index,
		})
			
		// passes in the original struct
		_card_instance.data = _card
		array_push(_drawn_cards, _card_instance)
	}
	
	publish(EVENTS.DRAW_CARDS, _drawn_cards)
}