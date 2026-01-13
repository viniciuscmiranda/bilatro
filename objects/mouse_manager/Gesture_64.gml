var _touch_x = event_data[?"posX"]
var _touch_y = event_data[?"posY"]

// stores touch position
x_pressed = _touch_x
y_pressed = _touch_y

var _instance = get_top_instance(_touch_x, _touch_y)

// trigger click event for touched instance
if (_instance != noone and not _instance.is_disabled) {
	_instance.on_click()
	publish(EVENTS.CLICKABLE_CLICK, _instance)
}

if (pressed_instance) {
	if (is_draggable(pressed_instance) and pressed_instance.is_dragging) {
		// end drag
		pressed_instance.is_dragging = false
		pressed_instance.on_drag_end()
		publish(EVENTS.DRAGGABLE_DRAG_END, _instance)
	}
	
	// reset pressed instance state
	// don't store pressed instance for touch events
	pressed_instance.is_pressed = false
	pressed_instance = noone
}

if (hovered_instance) {
	// reset hovered instance state
	hovered_instance.is_hovered = false
	hovered_instance = noone
}