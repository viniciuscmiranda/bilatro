event_inherited()

// setup
mult = 4

// setup tooltip
tooltip_title = get_joker_name(type)
tooltip_description = [
	{ text: $"+{mult}", color: COLOR_MULT },
	" Mult"
] 

// setup trigger
function trigger() {
	trigger_init(function() {
		trigger_type = TRIGGER_TYPES.MULT
		trigger_value = mult
		global.round.mult += mult
	})
}