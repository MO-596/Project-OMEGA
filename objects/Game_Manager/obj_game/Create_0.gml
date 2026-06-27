if (!variable_instance_exists(id, "Lives")) {
    global.manager = id;// used to track the gamemode
	// --- Music tracking ---
	current_music = undefined;
	music_default = snd_game_music; // the normal-gameplay track to return to
	
	// -- Main Game Logic
	points = 0; // Points of the player
    powerup_time = -1; // timer of the players equipped powerup
    Lives = 3; // number of lives of player
	
	global.boss_active = false;
	
    game_over = false;// Flag to indicate game over
	wave = 0;// the number of waves
	rocks_remaining = 0; // rocks to destroy this wave
	
	level = 10;// Change back to one for production
	max_level = 30;   // total number of rooms/levels
	level_message_timer = 0;
	
    rock_speed = 1;  // sets rock speed
	enemies_speed = 1; // set enemy speed
	
    alarm[2] = 1; // trigger first wave next frame
}
