/// @description Draw
if (draw_count <= 0) exit

draw_count--
play_sfx_pitched(snd_card_draw)
alarm_set(ALARMS.DRAW, delay(draw_delay))