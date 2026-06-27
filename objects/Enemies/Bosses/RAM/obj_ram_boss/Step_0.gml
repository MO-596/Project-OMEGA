switch (state) {
    case 0: // ENTERING — glide to center
        var dist = point_distance(x, y, target_x, target_y);
        var dir  = point_direction(x, y, target_x, target_y);
        var current_speed = max(0.5, min(entry_speed, dist / 30));

        if (dist > 2) {
            x += lengthdir_x(current_speed, dir);
            y += lengthdir_y(current_speed, dir);
            image_angle = 270;
        } else {
            x = target_x;
            y = target_y;
            state = 1; // begin first aim
            state_timer = aim_time;
        }
        break;

    case 1: // AIMING — rotate toward player
        if (instance_exists(obj_player)) {
            var target_angle = point_direction(x, y, obj_player.x, obj_player.y);
            // Smoothly rotate toward player (3 deg/frame)
            image_angle = image_angle + median(-3, 3, angle_difference(target_angle, image_angle));
        }
        state_timer--;
        if (state_timer <= 0) {
            state = 2;
            state_timer = windup_time;
            charge_direction = image_angle; // lock the angle now
			windup_base_x = x;          // remember position before jitter
			windup_base_y = y;
            image_blend = c_white; // flash white during windup
        }
        break;

    case 2: // WINDUP — frozen, flashing
		// Jitter around the locked-in position (doesn't drift)
		x = windup_base_x + random_range(-1, 1);
		y = windup_base_y + random_range(-1, 1);
		
		// Flash between white and red
		image_blend = (state_timer mod 4 < 2) ? c_red : c_white;
		if (state_timer mod 3 == 0) {
			effect_create_depth(depth,ef_spark, x, y, 1, c_red);
		}
		
		state_timer--;
        if (state_timer <= 0) {
			x = windup_base_x;          // snap back to true position before charging
			y = windup_base_y;
            state = 3; // CHARGE!
            image_blend = c_white;
			
			// Lock in the charge starting point
			charge_origin_x = x;
			charge_origin_y = y;
			charge_distance = 0;
        }
        break;

    case 3: // CHARGING — barrel forward until wall hit
		charge_distance += charge_speed;
        x = charge_origin_x + lengthdir_x(charge_distance, charge_direction);
		y = charge_origin_y + lengthdir_y(charge_distance, charge_direction);

        // Hit a wall? Stun.
        if (x < 50 || x > room_width - 50 || y < 50 || y > room_height - 50) {
            state = 4;
            state_timer = stun_time;
            // Optional: screen shake / impact effect here
        }
        break;

    case 4: // STUNNED — vulnerable
        state_timer--;
        if (state_timer <= 0) {
            // Each charge gets slightly faster as hp drops
            var hp_pct = hp / max_hp;
            aim_time = max(30, 90 * hp_pct);
            state = 1;
            state_timer = aim_time;
        }
        break;
}