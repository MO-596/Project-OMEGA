// Don't pick up if a timed powerup is already active
if (ghost_active || spread_active){ 
	with(other){
		instance_destroy();
	}
	exit;
}
audio_play_sound(snd_ghost_pickup,0, 0, 1.0, undefined, 1.0);
ghost_active = true;

// Don't override spread's yellow tint if it's active
if (!spread_active) {
    image_blend = $52FFFFFF & $ffffff;
    image_alpha = ($52FFFFFF >> 24) / $ff;
}

alarm[0] = 10 * 60; // 10 second timer for ghost

with(other){
	instance_destroy();
}