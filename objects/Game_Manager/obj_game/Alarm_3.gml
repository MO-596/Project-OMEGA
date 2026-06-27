
if (room == rm_ending || room == rm_credits){ 
	exit;
}


if (game_over) {
	// If the ending sequence is running, let it handle the transition.
    // obj_ending will call game_restart() at the end, which returns to the menu.
    if (instance_exists(obj_ending)){
		exit;
	}
    // Game won — return to menu
	// Normal game-won fallback (in case you ever win without triggering the ending)
    audio_stop_sound(snd_game_music);
	
	with(obj_particles) {
		instance_destroy();
	}
	
    instance_destroy();
    room_goto(rm_menu);
	
} else {
    alarm[2] = 60; // spawn rocks shortly after entering new room
}