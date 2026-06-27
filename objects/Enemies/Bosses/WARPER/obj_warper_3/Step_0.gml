 if (state == 1 || state == 2) {
     body_rotation_speed = -3; // spins clockwise + faster when warping
 } else {
     body_rotation_speed = lerp(body_rotation_speed, 1, 0.1);
 }
image_angle += body_rotation_speed;

switch(state){
	case 0:
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
            state = 4; // drop into idle, give the player a beat
            state_timer = idle_time;
        }
		break;
	
	case 1:// TELEGRAPHING — warning circle visible elsewhere, boss fades out
		state_timer--;
        image_alpha = state_timer / telegraph_time;
        if (state_timer <= 0) {
            // Teleport! Move to destination while invisible.
            x = teleport_target_x;
            y = teleport_target_y;
            state = 2;
            state_timer = teleport_time;
        }
		break;
	
	case 2:// TELEPORTING IN — fade in at new spot
		state_timer--;
        image_alpha = 1 - (state_timer / teleport_time);
        if (state_timer <= 0) {
            image_alpha = 1;
			state = 3;
			state_timer = attack_duration;
			volleys_fired = 0;
			alarm[0] = 15; // first volley fires shortly after appearing
        }
		break;
		
	 case 3: // ATTACKING — fire 4 evenly-spaced shots at the player
        state_timer--;
		if (state_timer <= 0 || volleys_fired >= volleys_to_fire) {
			alarm[0] = -1; // cancel any pending shot
			state = 4;
			state_timer = idle_time;
		}
        break;

    case 4: // IDLE — pause, then pick next destination
        state_timer--;
        if (state_timer <= 0) {
            // Pick a random spot inside the room
            teleport_target_x = random_range(edge_margin, room_width  - edge_margin);
            teleport_target_y = random_range(edge_margin, room_height - edge_margin);

            // Spawn the warning marker at the destination
            var marker = instance_create_layer(teleport_target_x, teleport_target_y,
                                               "Instances", obj_teleport_marker);
            marker.lifetime = telegraph_time;
            marker.max_lifetime = telegraph_time;

            state = 1;
            state_timer = telegraph_time;
        }
        break;	
}