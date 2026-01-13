/// @param {String} _text
/// @param {Real} _chars_per_line
/// @param {String} _delimiter
function break_text(_text, _chars_per_line, _delimiter = " ") {
	var _lines = [""]
	var _words = string_split(_text, _delimiter)

	for (var i=0; i < array_length(_words); i++) {
		var _word = _words[i]
		var _line = array_last(_lines)
		var _line_idx = array_length(_lines) - 1
		var _line_len = string_length(_line)
	
		if (_line_len + string_length(_word) > _chars_per_line) {
			array_push(_lines, _word)
		} else {
			_lines[_line_idx] = string_concat(
				_lines[_line_idx],
				_line == "" ? "" : _delimiter,
				_word
			)
		}
	}
	
	return _lines
}