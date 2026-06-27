if (!variable_instance_exists(id, "Lives")) {
	global.manager = id;
	
    points = 0; // Points of the player
    powerup_time = -1; // timer of the players equipped powerup
    Lives = 3; // number of lives of player
    game_over = false;// Flag to indicate game over
	
	survival_time = 0;
	new_best_time = false;
	new_best_score = false;
	//new_best = false; // for the "NEW BEST!" flash on death
	
	//wave = 0;// the number of waves
	//rocks_remaining = 0; // rocks to destroy this wave
	//wave_message_timer = 0;
	spawn_delay = 120; // frames between spawns (starts at 2 sec)
    alarm[2] = spawn_delay; // start the spawn loop
}