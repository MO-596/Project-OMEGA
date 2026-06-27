if (keyboard_check_pressed(vk_f2)) {
    show_debug_message(">>> F2: directly going to rm_credits");
    show_debug_message("rm_credits asset id: " + string(rm_credits));
    room_goto(rm_credits);
}

if (room == rm_credits || room == rm_menu || room == rm_ending){
	exit;
}
if (powerup_time > -1) {
    powerup_time -= 1;
}

if (level_message_timer > -1) {
    level_message_timer -= 1;
}

// All rocks AND enemies cleared, not already queued for next level
if (instance_number(obj_rock) == 0 && instance_number(obj_enemy_parent) == 0 &&
	!game_over && alarm[2] <= 0 && alarm[3] <= 0) {
    //alarm[2] = 60; // 1 second delay before next wave
	if (level >= max_level) {
        // Beat the last room — game won
        game_over = true;
        alarm[3] = 180; // show win message for 3 seconds
    } else {
        // Advance to next level
        level += 1;
        alarm[3] = 60; // 1 second pause before room change
    }
	
}
