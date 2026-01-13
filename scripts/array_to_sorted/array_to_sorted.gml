/// @param {Array} _array							The variable that holds the array.
/// @param {Function | Bool} _sorttype_or_function	The sort type (true for ascending or false for descending) or a function reference to use for sorting.
function array_to_sorted(_array, _sorttype_or_function) {
	var _copy = []
	array_copy(_copy, 0, _array, 0, array_length(_array))
	array_sort(_copy, _sorttype_or_function)
	
	return _copy
}
