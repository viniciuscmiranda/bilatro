/// @param {String | Array<Struct>} _text
function extract_text_settings(_text) {
	var _result = { text: "", settings: {} }
	
	if (typeof(_text) == "string") {
		_result.text = _text
	} else if (typeof(_text) == "array") {
		for (var d=0; d < array_length(_text); d++) {
			var _item = _text[d]
			var _str = ""
		
			if (typeof(_item) == "string") {
				_str = _item
			} else if (typeof(_item) == "struct") {
				_str = _item.text
			
				var _start = string_length(_result.text)
				var _end = _start + string_length(_str) - 1 
			
				for (var i=_start; i <= _end; i++) {
					_result.settings[$ i] = _item
				} 
			}
		
			_result.text = string_concat(_result.text, _str)
		}
	}
	
	return _result
}
