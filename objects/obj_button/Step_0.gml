// sync props from getter
var _props = get_props()

if (struct_exists(_props, "label")) label = _props.label
if (struct_exists(_props, "is_disabled")) is_disabled = _props.is_disabled

// handle sprite change
if (is_pressed) {
	sprite_index = spr_button_pressed
} else if (is_hovered) {
	sprite_index = spr_button_hover
} else {
	sprite_index = spr_button
}

// handle color change
if (is_disabled) {
	image_blend = COLOR_DISABLED_BUTTON
} else {
	image_blend = color
}