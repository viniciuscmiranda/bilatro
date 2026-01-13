/// @param {Struct} _struct_a
/// @param {Struct} _struct_b
/// @return {Struct}
/// @description
/// Returns a combined version of the provided structs
/// This does not merge nested structs
/// The second provided struct will have preference over the first one for duplicated keys
function struct_merge(_struct_a, _struct_b) {
	var _result = {}
	
	var _keys = variable_struct_get_names(_struct_a);
	for (var i=0; i < array_length(_keys); i++) {
		var _k = _keys[i];
		_result[$ _k] = _struct_a[$ _k];
	}
	
	_keys = variable_struct_get_names(_struct_b);
	for (var i=0; i < array_length(_keys); i++) {
		var _k = _keys[i];
		_result[$ _k] = _struct_b[$ _k];
	}
	
	return _result
}