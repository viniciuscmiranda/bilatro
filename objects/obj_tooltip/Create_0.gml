/// @desc
ALARMS = { RENDER: 0, DESTROY: 1 }

// setup
// init constants
chars_per_line = 16 
height = 160
width = 320
content_height = height * 0.8
min_scale_to_draw_text = 0.6
line_height = SPACE_3
render_delay = 20

// init description
var _settings = extract_text_settings(description)
description_text = _settings.text
description_settings = _settings.settings
description_lines = break_text(description_text, chars_per_line)

// starts at target position
x = target.x
y = target.y
position_step = 0.4
depth = -100

// starts with no size
scale = 0
scale_step = 0.4
min_scale_on_unmount = 0.2

// these are not related to the target object, they're values the tooltip should reach eventually
target_x = x
target_y = y
target_scale = 1 

// state props
render = false
is_unmounting = false

alarm_set(ALARMS.RENDER, render_delay)
// destroys instance if it did not render in time
alarm_set(ALARMS.DESTROY, render_delay + 5)

function destroy() {
	// decreases size until it desapears
	target_scale = 0
	is_unmounting = true
	// interrupt destory alarm
	alarm_set(ALARMS.DESTROY, -1)
}

// helpers
/// @description Calculate tooltip position related to the target
function position() {
	// positions on the bottom if can't fit on the top
	var _anchor_bottom = target.bbox_top < height
	var _wdiff = abs(target.sprite_width - width) / 2
	// goes to left or right if it can't fit on the center
	var _anchor_left = target.bbox_left < _wdiff
	var _anchor_right = room_width - target.bbox_right < _wdiff
	// position offset if needed, defaults to target's top center
	var _y_offset = target.sprite_height / 2 + height / 2 + SPACE_2
	var _x_offset = 0
	
	if (_anchor_left) {
		_x_offset = target.sprite_width / 2
	} else if (_anchor_right) {
		_x_offset = -target.sprite_width / 2
	}
	
	if (_anchor_bottom) {
		_y_offset = -_y_offset
	}
	
	// sets
	target_x = target.x + _x_offset
	target_y = target.y - _y_offset
}
