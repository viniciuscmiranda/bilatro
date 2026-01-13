if (theme == noone or not audio_is_playing(theme)) exit

var _pos = audio_sound_get_track_position(theme)
    
if (_pos >= (theme_length - theme_fade_time) and !theme_is_fading_out) {
    audio_sound_gain(theme, 0, theme_fade_time * 1000)
    theme_is_fading_out = true
}
    
if (_pos >= theme_length - theme_time_left_stop) {
	audio_stop_sound(theme)
	theme = play_theme()
}