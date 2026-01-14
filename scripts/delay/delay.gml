/// @param {Real} _delay
/// @description Makes delays shorter depending on global speed
function delay(_delay) {
	return _delay / global.animation_speed
}
