// Create
event_inherited()

// setup
skip = true
mult = 3

// setup tooltip
tooltip_title = get_joker_name(type)
tooltip_description = [
	"Cards of ",
	{ text: get_suit_label(suit), color: get_suit_color(suit) },
	" give ",
	{ text: $"+{mult}", color: COLOR_MULT },
	" Mult when scored"
]

/// @param {Id.Instance.obj_card} _card
function _on_card_trigger(_card) {
	if (_card.suit == suit) {
		trigger_init(function() {
			trigger_type = TRIGGER_TYPES.MULT
			trigger_value = mult
			global.round.mult += mult
		})
	}
}

// subscribers
init_events()
function init_events() {
	subscribe(EVENTS.CARD_TRIGGER, _on_card_trigger)
}