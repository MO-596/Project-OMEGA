event_inherited();

music_id = audio_play_sound(snd_game_music, 0, true, 0);
audio_sound_gain(music_id, 1, 1000);
alarm[0] = 60;

room_goto(rm_room_1);
