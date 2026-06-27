Lives -= 1;
	
if (Lives < 0) {	
	ini_open("savedata.ini");
	var best_score = ini_read_real("regular", "best_score", 0);
	if (points > best_score) {
		ini_write_real("regular", "best_score", points);
	}
	ini_close();
	
    game_over = true;
	// boss sound track keeps playing through the GAME OVER screen.
    // Alarm_4 stops it right before the room change to the menu.
	
    alarm_set(1, 120); // show "GAME OVER" for 2 seconds before menu

} else {

	
	// Respawn player at starting position - rocks/score/wave preserved
	var p = instance_create_layer(512, 768, "Instances", obj_player);
	p.ghost_active = true;
	p.image_blend = $52FFFFFF & $ffffff;
	p.image_alpha = ($52FFFFFF >> 24) / $ff;
	p.alarm[0] = 120; // 2 seconds of ghost mode
}
