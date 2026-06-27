switch (state) {
	case 0: // ENTERING
        var dist = point_distance(x, y, entry_target_x, entry_target_y);
        var dir  = point_direction(x, y, entry_target_x, entry_target_y);
        var current_speed = max(0.5, min(entry_speed, dist / 30));

        if (dist > 2) {
            x += lengthdir_x(current_speed, dir);
            y += lengthdir_y(current_speed, dir);
        } else {
            state = 1;
			alarm[0] = shoot_delay;
        }
        break;
		
	case 1:
	// ACTIVE — Fortress behavior
        // Drift around top third of screen
        x += lengthdir_x(drift_speed, drift_dir);
        y += lengthdir_y(drift_speed, drift_dir);
        if (x < 100 || x > room_width - 100) {
			drift_dir = 180 - drift_dir;
		}
        if (y < 100 || y > room_height / 2) { 
			drift_dir = -drift_dir;
		}

        // Rotate shield
        shield_angle += shield_rotation_speed;
		
		// Spawn shooter helpers (max 3 on screen)
        helper_spawn_timer--;
        if (helper_spawn_timer <= 0) {
            if (instance_number(obj_enemy_shooter) < 3) {
                scr_spawn_offscreen(obj_enemy_shooter);
            }
            helper_spawn_timer = 8 * 60;
        }
		break;
		
	case 2:// TRANSITIONING OUT — play animation then spawn phase 2
        state_timer--;
        x += random_range(-2, 2);
        y += random_range(-2, 2);

        if (state_timer <= 0) {
            // Spawn phase 2 at this location, then destroy self
            var next_boss = instance_create_layer(x, y,
                                                   "Instances", obj_omega_onslaught);
            next_boss.state = 1; // skip the entry phase
			// Inherit drift direction so motion feels continuous
			if (variable_instance_exists(next_boss, "drift_dir")) {
				next_boss.drift_dir = drift_dir;
			}
            instance_destroy();
        }
		break;		
		
}