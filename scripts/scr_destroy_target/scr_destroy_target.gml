/// @function scr_destroy_target(points_value, sound, do_split)
/// @param {real} points_value   Points to award
/// @param {asset} sound         Sound to play on destruction
/// @param {bool} do_split       Whether this should split (rocks) or not (enemies)
function scr_destroy_target(points_value, sound, do_split) 
{
	// Award points
    global.manager.points += points_value;

    // Sound with random pitch
    audio_play_sound(sound, 0, 0, 1.0, undefined, random_range(0.6, 1.1));
    
    // Particle explosion
    with(obj_particles) {
        part_particles_create(ps, other.x, other.y, pt_rock, 15);
    }
	
	 // Powerup drop chance (shared logic)
    if (global.manager.powerup_time < 0) {
		if (random(1) < 0.25) { // 25% chance when the window is open
			var drop = choose(obj_powerup_spread, obj_powerup_ghost, obj_powerup_extra_life);
			//var drop = choose(obj_powerup_spread, obj_powerup_ghost);
			instance_create_layer(x, y, "Instances", drop);
		}
       global.manager.powerup_time = 120;// reset cooldown either way
    }

    // Splitting only applies to rocks
    if (do_split) {
        var new_dir = random_range(0, 360);
        if (sprite_index == spr_rock_big) {
            sprite_index = spr_rock_small;
            image_index = 0;
            var copy = instance_copy(true);
            copy.direction = new_dir;
        } else {
            instance_destroy();
        }
    } else {
        instance_destroy();
    }
	
}