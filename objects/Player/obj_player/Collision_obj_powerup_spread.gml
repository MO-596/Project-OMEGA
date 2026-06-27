// Don't pick up if a timed powerup is already active
if (ghost_active || spread_active){
	with(other){
		instance_destroy();
	}
	exit;
}

audio_play_sound(snd_spread_pickup, 0, 0, 1.0, undefined, 1.0);
spread_active = true;

// Don't override the ghost's blue tint if it's active
if (!ghost_active) {
    image_blend = c_yellow;
}

alarm[1] = 10 * 60; // 10 second timer for spread — use a DIFFERENT alarm
with(other){
	instance_destroy();
}