var _count = array_length(items)
if (_count == 0) exit

var _items = items
// finds item being dragged
var _dragging_item_index = array_find_index(items, function (_item) {
	return _item.is_dragging
})

// if is dragging an item...
if (_dragging_item_index != -1) {
	var _dragging_item = items[_dragging_item_index]
	
	// checks if item is over drag area
	var _is_over = point_in_rectangle(
		_dragging_item.x,
		_dragging_item.y,
		x - width / 2,
		y - height / 2,
		x + width / 2,
		y + height / 2
	)
		
	if (_is_over) {
		// sorts other items to based on x position to make room for dragging item
		array_sort(items, function(_a, _b) {
			return _a.x - _b.x
		})
	} else {
		// ignores dragging item if not over drag area
		_items = array_filter(items, function (_item) {
			return not _item.is_dragging
		})
		
		_count = array_length(_items)
	}
}

var _spacing = round(min(width / _count, item_width))
var _total_width = (_count - 1) * _spacing
var _start_x = round(x - (_total_width / 2))

// position items
for (var i = 0; i < _count; i++) {
	var _item = _items[i]
	// gets custom item position if provided by children objects
	var _pos = get_item_position(_item, _start_x + (i * _spacing), y)
	
	_item.target_y = _pos.y
	_item.target_x = _pos.x
	
	// sets item depth based on position so right items stays on top
	// don't change dragging item depth
	if (not _item.is_dragging and not _item.is_going_back) {
		_item.depth = depth - i - 1
	}
}