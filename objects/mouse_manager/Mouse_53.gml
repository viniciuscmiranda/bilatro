var _instance = get_top_instance(mouse_x, mouse_y)

// stores mouse position on press
x_pressed = mouse_x
y_pressed = mouse_y

// enables pressed state on instance
if (_instance != noone and not _instance.is_disabled) {
	pressed_instance = _instance
	pressed_instance.is_pressed = true
}