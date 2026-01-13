// descreases size and opacity over time
scale = lerp(scale, max_scale, scale_step)
image_xscale = scale
image_yscale = scale

if (scale > max_scale * start_linear_alpha_at_scale) {
	image_alpha -= alpha_decrease
} else if (scale > start_lerp_alpha_at_scale) {
	image_alpha = lerp(image_alpha, 0, alpha_step)
}

// destroys instance if low alpha level is reached
if (image_alpha <= destroy_at_alpha) instance_destroy()
