event_inherited()

// skip is true for jokers that activate by it's own
skip = false
image_index = type

// setup default methods
define({
	init_events: function() {},
	trigger: function() {}
})

function reset_events() {
	unsubscribe_all()
	init_subscribers()
	init_events()
}
