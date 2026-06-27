// If the ending sequence is running, let it handle the transition
// If obj_ending or rm_ending is already taking over, skip
if (room == rm_ending || room == rm_credits){ 
	exit;
}

//audio_stop_sound(snd_game_music);

if (current_music != undefined) {
    audio_stop_sound(current_music);
    current_music = undefined;
}
// Ends the games and sends the player to the main menu
with(obj_particles) {
	instance_destroy();
	}
	
// Determine where to send the player

instance_destroy();

if (Lives > 0) {
    room_goto(rm_ending); //win path
} else {
    room_goto(rm_menu);// loss path
}