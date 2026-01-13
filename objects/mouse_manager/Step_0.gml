var _instance = get_top_instance(mouse_x, mouse_y)

if (pressed_instance) {
	var _is_mouse_inside = point_in_rectangle(mouse_x, mouse_y, 0, 0, room_width, room_height)

	if (is_draggable(pressed_instance)) {
		if (_is_mouse_inside and mouse_check_button(mb_left)) {
			var _diff = min(abs(x_pressed - mouse_x), abs(y_pressed - mouse_y))
	
			// starts dragging if mouse was moved before left button is released
			if (_diff > min_drag_dist) {
				// calls drag start event if was not dragging already 
				if not (pressed_instance.is_dragging) {
					pressed_instance.on_drag_start()
					publish(EVENTS.DRAGGABLE_DRAG_START, pressed_instance)
				}
		
				pressed_instance.is_dragging = true
			}
		} else {
			// ends dragging
			if (pressed_instance.is_dragging) {
				pressed_instance.on_drag_end()
				publish(EVENTS.DRAGGABLE_DRAG_END, pressed_instance)
			}
			
			pressed_instance.is_dragging = false
			pressed_instance.is_pressed = false
			pressed_instance = noone
		}
	}
}

// ends hover on previous hovered instance
if (hovered_instance and (hovered_instance != _instance or hovered_instance.is_dragging) and hovered_instance.is_hovered) {
	hovered_instance.is_hovered = false
	hovered_instance.on_hover_end()
	publish(EVENTS.CLICKABLE_HOVER_END, _instance)
}

// if mouse is on top of a valid instance...
if (_instance != noone and not _instance.is_disabled and not _instance.is_dragging) {
	// sets cursor to hand
	window_set_cursor(cr_handpoint)
	hovered_instance = _instance
	
	// calls on on hover callback if not already hovering
	if not (_instance.is_hovered) {
		hovered_instance.is_hovered = true
		hovered_instance.on_hover_start()
		publish(EVENTS.CLICKABLE_HOVER_START, _instance)
	}
} else {
	// resets cursor to default
	window_set_cursor(cr_default)
	hovered_instance = noone
	
	// resets pressed instance if is not draggable
	if (pressed_instance and not is_draggable(pressed_instance)) {
		pressed_instance.is_pressed = false
		pressed_instance = noone
	}
}
