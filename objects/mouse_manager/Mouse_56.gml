var _instance = get_top_instance(mouse_x, mouse_y)

// calls on click event if when mouse left is released on the same instance it was pressed
if (
	_instance != noone 
	and _instance == pressed_instance 
	and not _instance.is_disabled
	and not _instance.is_dragging
) {
	_instance.on_click()
	publish(EVENTS.CLICKABLE_CLICK, _instance)
}

if (pressed_instance) {
	// ends dragging when mouse left is released
	if (is_draggable(pressed_instance) and pressed_instance.is_dragging) {
		pressed_instance.is_dragging = false
		pressed_instance.on_drag_end()
		publish(EVENTS.DRAGGABLE_DRAG_END, _instance)
	}
	
	pressed_instance.is_pressed = false
	pressed_instance = noone
}