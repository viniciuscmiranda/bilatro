if not (render) exit

x = lerp(x, target_x, position_step)
y = lerp(y, target_y, position_step)
scale = lerp(scale, target_scale, scale_step)

if not (is_unmounting) {
	// keeps positioning so it follows the target 
	position()
} else if (scale <= min_scale_on_unmount) {
	// destroys if it gets to small while unmounting
	instance_destroy()
}