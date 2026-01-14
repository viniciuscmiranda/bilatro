/// @param {Enum.TRIGGER_TYPES} _trigger_type
function create_score_particle(_trigger_type, _trigger_value = "") {
	instance_create_depth(
		x,
		y,
		-100,
		obj_score_particle,
		{ trigger_type: _trigger_type, trigger_value: _trigger_value }
	)
}