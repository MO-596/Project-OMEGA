if (obj_player.ghost_active) {
    instance_destroy(); // ghost mode — bullet fizzles, player survives
    exit;
}

// Trigger player death (reuse your existing death flow)
with(obj_player) {
    // Particle explosion
    with(obj_particles) {
        part_particles_create(ps, other.x, other.y, pt_rock, 15);
    }
	
    instance_destroy();
    audio_play_sound(snd_lose, 0, 0, 1.0, undefined, 1.0);
}
with(global.manager) {
    alarm_set(0, 120);
}
instance_destroy(); // destroy the enemy bullet