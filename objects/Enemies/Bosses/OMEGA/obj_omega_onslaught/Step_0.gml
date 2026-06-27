image_angle += 1.5;
switch (state) {

    case 1: // ACTIVE — Onslaught behavior
	// Update bullets locked to spinning barrels
	for (var i = ds_list_size(locked_bullets) - 1; i >= 0; i--) {
		var entry = locked_bullets[| i];

		// Drop the entry if the bullet was destroyed (e.g., hit by player)
		if (!instance_exists(entry.bullet)) {
			ds_list_delete(locked_bullets, i);
			continue;
		}

		if (entry.frames > 0) {
			// Glue bullet to the rotating barrel
			var angle = image_angle + entry.offset_angle;
			with (entry.bullet) {
				x = other.x + lengthdir_x(other.barrel_dist, angle);
				y = other.y + lengthdir_y(other.barrel_dist, angle);
				direction = angle;
				image_angle = angle;
				speed = 0;
			}
			entry.frames--;
		} else {
		// Release — bullet flies outward in current barrel direction
			with (entry.bullet) {
            speed = 5;
        }
        ds_list_delete(locked_bullets, i);
    }
}
        // Dash to new positions
        dash_timer--;
        if (dash_timer <= 0 && !dashing) {
            dash_target_x = random_range(150, room_width - 150);
            dash_target_y = random_range(100, room_height / 2);
            dashing = true;
        }
        if (dashing) {
			var dist = point_distance(x, y, dash_target_x, dash_target_y);
			var dir  = point_direction(x, y, dash_target_x, dash_target_y);
			// Speed up as it gets going, slow down as it arrives
			var dash_speed = clamp(dist / 8, 2, 10);
			
			if (dist > 4) {
				x += lengthdir_x(6, dir);
				y += lengthdir_y(6, dir);
			} else {
				dashing = false;
				dash_timer = 180;
			}
		} else {
		// Idle drift — restless figure-eight-ish motion
		x += lengthdir_x(drift_speed, drift_dir);
		y += lengthdir_y(drift_speed, drift_dir);

		// Bounce off bounds
		if (x < 150 || x > room_width - 150) drift_dir = 180 - drift_dir;
		if (y < 100 || y > room_height / 2)  drift_dir = -drift_dir;

		// Random small course corrections so it doesn't look like a straight line
		if (irandom(20) == 0){
			drift_dir += random_range(-30, 30);
		}
	}
        // Kamikaze spawning
        kamikaze_spawn_timer--;
        if (kamikaze_spawn_timer <= 0) {
            if (instance_number(obj_enemy_kamikaze) < 2) {
                scr_spawn_offscreen(obj_enemy_kamikaze);
            }
            kamikaze_spawn_timer = 12 * 60;
        }
        break;

    case 2: // TRANSITIONING OUT
        state_timer--;
        x += random_range(-2, 2);
        y += random_range(-2, 2);

        if (state_timer <= 0) {
            var next_boss = instance_create_layer(x, y,
                                                   "Instances", obj_omega_meltdown);												 
            next_boss.state = 1;
			// Inherit drift direction so motion feels continuous
			if (variable_instance_exists(next_boss, "drift_dir")) {
				next_boss.drift_dir = drift_dir;
			}
            instance_destroy();
        }
        break;
}