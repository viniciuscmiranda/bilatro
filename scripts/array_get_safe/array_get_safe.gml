/// @param {Array} _array
/// @param {Real} _index
/// @description Returns found array element or undefined
function array_get_safe(_array, _index) {
    if (_index < 0 || _index >= array_length(_array)) {
        return undefined;
    }
	
    return _array[_index];
}