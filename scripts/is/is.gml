/// @param {Asset.GMObject} _object
/// @param {Id.Instance} [_instance]
/// @description Returns weather or not an instance is ancestor of an object
function is(_object, _instance = id) {
	return 
		_instance.object_index == _object
		or object_is_ancestor(_instance.object_index, _object)
}