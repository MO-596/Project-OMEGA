if (audio_is_playing(credits_music)) {
    audio_stop_sound(credits_music);
}
global.menu_music_playing = false;
room_goto(rm_menu);