// Ignore damage while entering
with(other){ 
	instance_destroy(); // still destroy the bullet
}

// Silently ignore hits during the entry phase — no damage, no sound, no flash
if (state == 0){ 
	exit;
}

hp -= 1;/*

*/
// Flash red on hit (only visible if it survives)
if (hp > 0) {
    image_blend = c_red;
    alarm[1] = 5; // reset color after 5 frames
}

if (hp <= 0) {
	if (instance_exists(ring)) {
		instance_destroy(ring);
	}
    scr_destroy_target(3500, warper_death_snd, false);
	//global.boss_active = false;
	scr_restore_default_music();
}