
ini_open("savedata.ini");
var best_score = ini_read_real("regular", "best_score", 0);

if (points > best_score) {
    ini_write_real("regular", "best_score", points);
}
ini_close();

//audio_sound_gain(music_id, 0, 1000);
alarm[4] = 60;
