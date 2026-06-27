if (room == rm_credits || room == rm_menu|| room == rm_credits){
	exit;
}
current_music = audio_play_sound(snd_game_music, 0, true, 0);
audio_sound_gain(current_music, 1, 1000); // fade in over 1s