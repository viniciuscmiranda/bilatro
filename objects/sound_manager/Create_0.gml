ALARMS = { DRAW: 0 }

// setup theme
theme_fade_time = 5
theme_is_fading_out = false
theme = play_theme()
theme_length = audio_sound_length(theme)
theme_time_left_stop = 0.05

// setup draw
draw_count = 0
draw_delay = 9

// subscribers
subscribe(EVENTS.SELECT_CARD, _on_select_card)
subscribe(EVENTS.CARD_TRIGGER, _on_card_trigger)
subscribe(EVENTS.JOKER_TRIGGER, _on_card_trigger)
subscribe(EVENTS.DRAW_CARDS, _on_draw_cards)
subscribe(EVENTS.DISCARD_HAND, _on_discard_hand)
subscribe(EVENTS.JOKERS_END, _on_discard_hand)
subscribe(EVENTS.CLICKABLE_CLICK, _on_clickable_click)

function _on_discard_hand() {
	play_sfx_pitched(snd_card_discard)
}

function _on_select_card() {
	play_sfx_pitched(snd_card_select)
}

/// @param {Id.Instance.obj_clickable_primitive} _clickable
function _on_clickable_click(_clickable) {
	if (is(obj_button, _clickable)) {
		play_sfx_pitched(snd_button_click)
	}
}

/// @param {Array<Id.Instance.obj_card>} _cards
function _on_draw_cards(_cards) {
	draw_count = array_length(_cards)
	alarm_start(ALARMS.DRAW)
}

/// @param {Id.Instance.obj_card_parent} _card
function _on_card_trigger(_card) {
	var _spd = global.animation_speed / global.max_animation_speed
	var _min = 0.5 + _spd
	var _max = 0.8 + _spd
	
	switch (_card.trigger_type) {
		case TRIGGER_TYPES.CHIPS:
			play_sfx_pitched(snd_chips, _min, _max)
			break
		case TRIGGER_TYPES.MULT:
			play_sfx_pitched(snd_mult, _min, _max)
			break
	}
}

// helpers
function play_theme() {
	theme_is_fading_out = false
	var _theme = audio_play_sound(msc_theme, -5, false, 0)
	audio_sound_gain(_theme, global.music_volume, theme_fade_time * 1000)
	
	return _theme
}

/// @param {Asset.GMSound} _sfx
/// @param {Real} [_pitch]
/// @return {Id.Sound}
function play_sfx(_sfx, _pitch = 1) {
	return audio_play_sound(
		_sfx,
		0,
		false,
		global.sfx_volume,
		undefined,
		_pitch
	)
}

/// @param {Asset.GMSound} _sfx
/// @param {Real} [_min]
/// @param {Real} [_max]
/// @return {Id.Sound}
function play_sfx_pitched(_sfx, _min = 0.9, _max = 1.1) {
	return play_sfx(_sfx, random_range(_min, _max))
}
