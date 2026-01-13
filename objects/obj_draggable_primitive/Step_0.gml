var _step = base_speed
var _x = target_x
var _y = target_y
var _scale = target_scale
var _dist = max(abs(x - target_x), abs(y - target_y))

// if too far from original position then it's going back from dragging
is_going_back = _dist > going_back_target_dist
depth = base_depth

// follows mouse when dragging
if (is_dragging) {
	_x = mouse_x
	_y = mouse_y
	_step = follow_mouse_speed
} 

// keeps low depth when going back
if (is_dragging or is_going_back) {
	depth = depth_when_dragging
}

if (is_hovered) {
	_scale = scale_on_hover
} 

x = lerp(x, _x, _step)
y = lerp(y, _y, _step)
image_xscale = lerp(image_xscale, _scale, scale_speed)
image_yscale = lerp(image_yscale, _scale, scale_speed)
image_angle = lerp(image_angle, clamp(x - _x, -max_angle_shift, max_angle_shift), angle_speed)