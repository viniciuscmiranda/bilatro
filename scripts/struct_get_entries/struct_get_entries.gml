/// @param {Struct} _struct
/// @return {Array<Struct>}	
/// @description Returns Array<{ name: String, value: Any }>
function struct_get_entries(_struct) {
	var _keys = struct_get_names(_struct)
	var _entries = []
	
	for (var i=0; i < array_length(_keys); i++) {
		var _key = _keys[i]
		var _value = _struct[$ _key]
		
		array_push(_entries, { name: _key, value: _value })
	}
	
	return _entries
}