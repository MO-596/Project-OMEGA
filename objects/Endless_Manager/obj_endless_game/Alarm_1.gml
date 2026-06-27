ini_open("savedata.ini");
var best_score = ini_read_real("regular", "best_score", 0);

if (points > best_score) {
    ini_write_real("regular", "best_score", points);
}
ini_close();

audio_stop_sound(snd_game_music);
// Ends the games and sends the player to the main menu
with(obj_particles) {
	instance_destroy();
	}
instance_destroy();
room_goto(rm_menu);
