// Only start if it isn't already playing (prevents restart on re-entry)
// If menu music is already playing globally, this duplicate exits immediately

show_debug_message("=== snd_menu_music played by obj_menu_music ===");
if (variable_global_exists("menu_music_playing") && global.menu_music_playing) {
    instance_destroy();
    exit;
}
//if (!audio_is_playing(snd_menu_music)) {
	//audio_play_sound(snd_menu_music,0, true, 1.0);
	global.menu_music_playing = true;
	music_id = audio_play_sound(snd_menu_music, 0, true, 0); // start silent (gain = 0)
	audio_sound_gain(music_id, 1, 1000);    // fade up to full over 1 second
//}
//OTODO :ISSUE WITH THE MUSIC PLAYING AT THE ENDING SCENE
