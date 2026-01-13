/// @param {String} _string
/// @param {Real} _start
/// @param {Real} [_end]
function string_slice(_string, _start, _end = array_length(_string)) {
	var _result = ""
	
	for (var i=_start; i < _end; i++) {
		var _char = string_char_at(_string, i + 1)
		_result = string_concat(_result, _char)
	}
	
	return _result
}