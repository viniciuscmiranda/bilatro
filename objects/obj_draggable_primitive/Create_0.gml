event_inherited()

index = -1 // index inside drag area
target_x = x
target_y = y
target_scale = 1
base_depth = -10
depth_when_dragging = -100
scale_on_hover = 1.08
base_speed = 0.2
scale_speed = 0.3
follow_mouse_speed = 0.25
max_angle_shift = 35
angle_speed = 0.3
going_back_target_dist = 200
is_going_back = false

image_speed = 0
image_xscale = 1
image_yscale = 1
image_angle = 0

// init methods
define({
	on_drag_start: function() {},
	on_drag_end: function() {}
})
