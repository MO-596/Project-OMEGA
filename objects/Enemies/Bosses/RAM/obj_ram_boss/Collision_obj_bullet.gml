// Ignore damage while entering
with(other){ 
	instance_destroy(); // still destroy the bullet
}

// Only take damage when stunned (state 4)
if (state != 4) {
    // Blocked hit — quick gray blip so the player gets feedback
	audio_play_sound(snd_blocked, 0, 0, 0.6);
    image_blend = c_gray;
    alarm[1] = 3;
	
	instance_create_layer(other.x, other.y, "Instances", obj_blocked_text);
	//popup.text = "-1";
	//popup.text_color = c_red;
	
    exit;
}

// we're in combat now — apply damage
hp -= 1;/*
with(other){ 
	instance_destroy(); // destroy the bullet}
}
*/
// Flash red on hit (only visible if it survives)
if (hp > 0) {
    image_blend = c_red;
    alarm[1] = 5; // reset color after 5 frames
}

if (hp <= 0) {
    scr_destroy_target(3000, ram_death_snd, false);
	//global.boss_active = false;
	scr_restore_default_music();
}