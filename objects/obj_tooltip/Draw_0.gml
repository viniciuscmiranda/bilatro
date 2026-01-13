/// @desc
if not (render) exit

/// @description Makes every value keeps the scale
function s(_n) { return _n * scale }

// uses scale as alpha so it get's slighty transparent while growing
var _alpha = scale

// setup
var _x1 = x - s(width / 2)
var _y1 = y - s(height / 2)
var _x2 = x + s(width / 2)
var _y2 = y + s(height / 2)
var _border_w = s(SPACE_1 / 2)
var _radius = s(RADIUS_4)
var _shadow_offset = s(SPACE_1)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// draws an outer box as border
draw_box_shadow(
	_x1 - _border_w,
	_y1 - _border_w,
	_x2 + _border_w,
	_y2 + _border_w,
	c_white,
	_radius,
	_radius,
	-_shadow_offset,
	_shadow_offset,
	_alpha
)

// draws container
draw_set_colour(COLOR_TOOLTIP_BACKGROUND)
draw_set_alpha(_alpha)
draw_roundrect_ext(_x1, _y1, _x2, _y2, _radius, _radius, false)

// setup for drawing content
var _content_h = s(content_height)
var _padding = s(SPACE_2 * 0.7)
var _diff_h = s(height) - s(_content_h)
var _content_x1 = _x1 + _padding
var _content_y1 = _y1 + _padding + _diff_h
var _content_x2 = _x2 - _padding
var _content_y2 = _y2 - _padding
var _content_border_w = s(SPACE_1 / 3)

// draws content container border
draw_set_colour(c_gray)
draw_roundrect_ext(_content_x1, _content_y1, _content_x2, _content_y2 + _content_border_w, _radius, _radius, false)

// draws content container
draw_set_colour(c_white)
draw_roundrect_ext(_content_x1, _content_y1, _content_x2, _content_y2, _radius, _radius, false)

draw_reset()
// don't draw text if it's still too small
if (scale < min_scale_to_draw_text) exit

// draw title
draw_setup_text(fa_center, fa_middle)
draw_text_shadow(
	x,
	// positions on top center adding a bit of space for better font alignment
	_y1 + _diff_h / 2 + s(SPACE_1),
	title,
	scale,
	scale,
	0,
	c_white,
	// makes shadow offset scale
	-s(SPACE_1 / 4),
	s(SPACE_1 / 4),
	_alpha
)

draw_reset()

// setup for drawing content
draw_setup_text(fa_center, fa_middle)
var _desc_line_h = s(line_height)
// caculates total description height
var _desc_h = array_length(description_lines) * _desc_line_h
var _desc_align = s(SPACE_2 * 0.8)
// calculates where to start drawing based on description height
var _desc_y_start = ((_content_y1 + _content_y2) / 2) - _desc_h / 2 + _desc_align
var _content_x_center = (_content_x1 + _content_x2) / 2
// current character position on original provided description (before breaking into lines)
var _char_index = 0

for (var l=0; l < array_length(description_lines); l++) {
	var _line = description_lines[l]
	// calculates current line position
	var _line_y = _desc_y_start + (l * _desc_line_h)
	var _line_x = _content_x_center - string_width(_line) / 2 + s(SPACE_1)
	
	for (var c=0; c < string_length(_line); c++) {
		var _color = COLOR_TEXT_DARK
		
		// extract and apply settings for current character
		var _settings = description_settings[$ _char_index]
		if (_settings and _settings.color) _color = _settings.color
		
		// adds to the char count
		_char_index++
		
		// draws character
		var _char = string_char_at(_line, c + 1)
		// current line width taking into account characters the were already drawn
		var _curr_line_width = string_width(string_copy(_line, 0, c))
		draw_text_shadow(
			_line_x + _curr_line_width,
			_line_y,
			_char,
			scale,
			scale,
			0,
			_color, 
			// makes shadow offset scale
			-s(SPACE_1 / 4),
			s(SPACE_1 / 4),
			_alpha
		)
	}
	
	// adds after each to compensate for removed white spaces
	_char_index++
} 

draw_reset()