/// @desc

items = []
item_width = 10

/// @param {Id.Instance.obj_draggable_primitive} _item
/// @param {Real} _x
/// @param {Real} _y
/// @return {Struct} 
/// @description Returns { x: Real, y: Real }
function get_item_position(_item, _x, _y) {
	return { x: _x, y: _y }
}
