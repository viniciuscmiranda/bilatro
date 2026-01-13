// stops shaking when a small value is reached
if (shake_intensity < 0.1) {
	shake_intensity = 0
    camera_set_view_pos(view_camera[0], 0, 0)
	exit
}

// sets camera to a random position
var _x_offset = irandom_range(-shake_intensity, shake_intensity)
var _y_offset = irandom_range(-shake_intensity, shake_intensity)
    
var _cam = view_camera[0]
camera_set_view_pos(_cam, _x_offset, _y_offset)
    
// decrease shake intensity
shake_intensity *= shake_decay