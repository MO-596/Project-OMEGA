// Persistent object — kill the music if we've entered a non-menu room
if (room != rm_menu && room != rm_score) {
    if (!variable_instance_exists(id, "fading_out")) {
        fading_out = true;
        audio_sound_gain(music_id, 0, 1000);
        alarm[0] = 60;
    }
}