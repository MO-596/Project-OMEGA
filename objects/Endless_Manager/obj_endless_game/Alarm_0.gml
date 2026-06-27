Lives -= 1;

if (Lives <= 0) {
	// Only NOW (final death) do we save and check for a record
	// --- Best survival time ---
    ini_open("savedata.ini");
    var best_time = ini_read_real("endless", "best_time", 0);
    if (survival_time > best_time) {
        ini_write_real("endless", "best_time", survival_time);
        new_best_time = true; // player beat their record
    }

	 // --- Best endless score ---
    var best_score = ini_read_real("endless", "best_score", 0);
    if (points > best_score) {
        ini_write_real("endless", "best_score", points);
        new_best_score = true; // also counts as a new best
    }
    ini_close();

    game_over = true;
    alarm_set(1, 120); // show "GAME OVER" for 2 seconds before menu
} else {
	//give player brief invincibility on respawn, to prevent them from dieing when rocks
	// are passing at the respawn point
	var p = instance_create_layer(512, 768, "Instances", obj_player);
	p.ghost_active = true;
	p.image_blend = $52FFFFFF & $ffffff;
	p.image_alpha = ($52FFFFFF >> 24) / $ff;
	p.alarm[0] = 120; // 2 seconds of ghost mode

}
