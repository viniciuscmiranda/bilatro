/// @param {String} _title
/// @param {String} _description
function create_tooltip(_title, _description) {
	return instance_create_depth(
		0,
		0,
		0,
		obj_tooltip,
		{ target: id, title: _title, description: _description }
	)
}