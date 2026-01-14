x_pressed = 0
y_pressed = 0
min_drag_dist = 5
/// @type {Id.Instance.obj_clickable_primitive}
hovered_instance = noone
/// @type {Id.Instance.obj_clickable_primitive}
pressed_instance = noone

/// @param {Real} _x
/// @param {Real} _y
/// @return {Id.Instance.obj_clickable_primitive | Undefined}
function get_top_instance(_x, _y) {
	var _instances = ds_list_create()
	var _instance_count = instance_position_list(
		_x,
		_y,
		obj_clickable_primitive,
		_instances,
		false
	)

	if (_instance_count > 0) {
	    var _top_instance = noone

	    for (var i = 0; i < _instance_count; i++) {
	        var _clickable = _instances[| i]
		
	        if (not _top_instance or _clickable.depth < _top_instance.depth) {
	            _top_instance = _clickable
	        }
	    }

	   	return _top_instance
	}
	
	return noone
}

/// @param {Id.Instance.obj_clickable_primitive} _instance
/// @return {Bool}
function is_draggable(_instance) {
	return is(obj_draggable_primitive, _instance)
}