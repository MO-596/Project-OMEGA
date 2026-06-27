
// Ignore damage while entering
if (entering) {
    with(other){ 
		instance_destroy(); // still destroy the bullet
	}
    exit;
}

// we're in combat now — apply damage
hp -= 1;
with(other){ 
	instance_destroy(); // destroy the bullet}
}

// Flash red on hit (only visible if it survives)
if (hp > 0) {
    image_blend = c_red;
    alarm[1] = 5; // reset color after 5 frames
}

if (hp <= 0) {
    scr_destroy_target(2000, barrage_death_snd, false);
	//global.boss_active = false;
	scr_restore_default_music();
}