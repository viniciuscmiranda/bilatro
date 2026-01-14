/// @param {Struct} _props
/// @param {Id.Instance} [_instance]
/// @description Defines instance props and methods if they don't already exist
function define(_props, _instance = id) {
	var _entries = struct_get_entries(_props)
	
	for (var i=0; i < array_length(_entries); i++) {
		var _prop = _entries[i]
		
		if not (variable_instance_exists(_instance, _prop.name)) {
			variable_instance_set(_instance, _prop.name, _prop.value)
		}
	}
}