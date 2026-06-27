// Ignore damage while entering
if (entering) {
    with(other){ 
		instance_destroy(); // still destroy the bullet
	}
    exit;
}

with(other){ 
	instance_destroy(); // destroy the bullet
}

hp -= 1;
image_blend = c_red;
alarm[1] = 4; // flash on hit
    
if (hp <= 0) {
	// Boss defeated
    if (instance_exists(obj_aegis_boss_shield)) {
		with(obj_aegis_boss_shield) instance_destroy();
    }
		//global.boss_active = false;
        scr_destroy_target(1000, aegis_death_snd, false);
		scr_restore_default_music();
    }
	
