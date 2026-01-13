/// @param {Array} _array
/// @param {Func} _get_key return {String | Real}
/// @return {Array<Struct>}
/// @description Returns a sorted list by the most repeated key to the least one
/// returns Array<{ key: String, count: Real }>
function array_group_count(_array, _get_key) {
	var _groups_by_key = {}
	
	for (var i=0; i < array_length(_array); i++) {
		var _item = _array[i]
		var _key = _get_key(_item)
		
		if not (variable_struct_exists(_groups_by_key, _key)) {
			_groups_by_key[$ _key] = { key: _key, count: 0 }
		}
		
		_groups_by_key[$ _key].count++
	}
	
	
	var _entries = struct_get_entries(_groups_by_key)
	var _groups = array_map(_entries, function(_entry) {
		return _entry.value
	})
	
	array_sort(_groups, function(_a, _b) {
		return _b.count - _a.count
	})
	
	return _groups
}