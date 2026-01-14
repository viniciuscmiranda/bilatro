/// @desc
event_inherited()
ALARMS = { DRAW: 0, DISCARD: 1 }

is_disabled = false
draw_delay = 10
discard_delay = 3

// setup cards
/// @type {Array<Id.Instance.obj_card>}
cards = []
/// @type {Array<Id.Instance.obj_card>}
selected_cards = []
/// @type {Array<Id.Instance.obj_card>}
drawing_cards = []
/// @type {Array<Id.Instance.obj_card>}
discarding_cards = []

// setup drag area props
items = cards
// setting width to slighy shorter than the sprite so cards are placed on top of each other
item_width = sprite_get_width(spr_cards) * 0.8
function get_item_position(_card, _x, _y) {
	return { 
		x: _x,
		// selected cards move upwards a bit
		y: _y - (is_card_selected(_card) * SPACE_6)
	}
}

// subscribers
subscribe(EVENTS.DRAW_CARDS, _on_draw_cards)
subscribe(EVENTS.PLAY_HAND, _on_play_hand)
subscribe(EVENTS.JOKERS_END, _on_jokers_end)
subscribe(EVENTS.DISCARD_HAND, _on_discard_hand)

/// @param {Array<Id.Instance.obj_card>} _cards
function _on_draw_cards(_cards) {
	// copies cards to drawing list
	array_extend(drawing_cards, _cards)
	
	for (var i=0; i < array_length(_cards); i++) {
		var _card = _cards[i]
		// initialize cards fliped back
		_card.sprite_index = _card.back_sprite_index
		_card.image_index = _card.back_image_index
	}

	// starts drawing
	alarm_start(ALARMS.DRAW)
}

function _on_discard_hand() {
	// copies selected cards to discard list
	array_extend(discarding_cards, selected_cards)
	
	// remove selected cards
	cards = array_filter(cards, function(_card) { 
		return not is_card_selected(_card)
	})
	
	// clear selected card
	selected_cards = []
	// disables hand until discard is finished
	is_disabled = true
	
	// starts discarding
	alarm_start(ALARMS.DISCARD)
}

function _on_play_hand() {
	// remove selected cards
	cards = array_filter(cards, function(_card) { 
		return not is_card_selected(_card)
	})
	
	// clear seleced cards
	selected_cards = []
	// disables handle until scoring finsihes
	is_disabled = true
}

function _on_jokers_end() {
	// enables hand back after jokers scored
	is_disabled = false
}

// helpers
/// @param {Id.Instance.obj_card} _card
function is_card_selected(_card) {
	return array_contains(selected_cards, _card)
}

function can_select_cards() {
	return not is_disabled and array_length(selected_cards) < global.run.max_selected_cards
}

/// @description Sorts selected cards by their index on cards array
function sort_selected_cards() {
	array_sort(selected_cards, function(_a, _b) {
		var _a_index = array_get_index(cards, _a)
		var _b_index = array_get_index(cards, _b)
		return _a_index - _b_index
	})
}