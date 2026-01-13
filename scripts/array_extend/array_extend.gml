/// @param {Array} _dest
/// @param {Array} _src
/// @param {Bool} [_replace]
function array_extend(_dest, _src, _replace = false) {
	var _dest_start = _replace ? 0 : array_length(_dest)
	array_copy(_dest, _dest_start, _src, 0, array_length(_src))
}