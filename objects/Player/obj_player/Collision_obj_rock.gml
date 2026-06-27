if(ghost_active)
{
	exit;
}

//effect_create_depth(depth,ef_firework, x, y, 1, c_white);
with(obj_player) {
		// Particle explosion
		with(obj_particles) {
			part_particles_create(ps, other.x, other.y, pt_rock, 15);
		}
        instance_destroy();
        audio_play_sound(snd_lose, 0, 0, 1.0, undefined, 1.0);
}
//instance_destroy();
//audio_play_sound(snd_lose, 0, 0, 1.0, undefined, 1.0);

with(global.manager) {
	alarm_set(0, 120);
}

