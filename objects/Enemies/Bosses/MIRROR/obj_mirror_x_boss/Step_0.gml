if (entering) {
    // Glide toward center
    var dist = point_distance(x, y, target_x, target_y);
    var dir = point_direction(x, y, target_x, target_y);
	
    // Speed scales with distance — slows as it approaches
    var current_speed = max(0.5, min(entry_speed, dist / 30));
	
    if (dist > 2) {
        x += lengthdir_x(current_speed, dir);
        y += lengthdir_y(current_speed, dir);
    } else {
        // Arrived
        x = target_x;
        y = target_y;
        entering = false;
        alarm[0] = shoot_delay; // begin shooting
		
    }
    
    // Don't aim yet during entry — keep a fixed angle for drama
     image_angle = 270; // facing down at start
} else {
	// Combat phase — mirror the player's movement
	
    if (instance_exists(obj_player)) {
        // If player is in respawn invincibility (powerup == 2 from respawn), boss eases off
        var player_invincible = (obj_player.ghost_active && obj_player.alarm[0] > 0);
		
		// The "mirror" line: reflect the player's position across the center of the room
        var mirror_x = room_width - obj_player.x;
        var mirror_y = obj_player.y; // mirror only on X axis — feels like reflection
        
        // Move toward the mirrored position
        var dir_to_target = point_direction(x, y, mirror_x, mirror_y);
        var dist_to_target = point_distance(x, y, mirror_x, mirror_y);
        
		// Slow way down while the player is invincible — gives them recovery time
        var effective_speed = player_invincible ? move_speed * 0.2 : move_speed;
		
        if (dist_to_target > 5) {
            var step_speed = min(effective_speed, dist_to_target / 10);
            x += lengthdir_x(step_speed, dir_to_target);
            y += lengthdir_y(step_speed, dir_to_target);
        }
        
        // Face the player
		var target_angle = point_direction(x, y, obj_player.x, obj_player.y);
		image_angle += angle_difference(target_angle, image_angle) * 0.1;
        //image_angle = point_direction(x, y, obj_player.x, obj_player.y);
    }

}