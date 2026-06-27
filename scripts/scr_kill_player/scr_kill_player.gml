/// @function scr_kill_player()
function scr_kill_player() {
   show_debug_message("boss_active = " + string(global.boss_active) + ", current_music = " + string(global.manager.current_music));


    if (obj_player.ghost_active){
		exit;
		}
    with(obj_player) {
		// Particle explosion
		with(obj_particles) {
			part_particles_create(ps, other.x, other.y, pt_rock, 15);
		}
        instance_destroy();
        audio_play_sound(snd_lose, 0, 0, 1.0, undefined, 1.0);
    }

	if (!global.boss_active) {
		scr_restore_default_music();
	}
	
	    with(global.manager){
		alarm_set(0, 120);
	}
}
