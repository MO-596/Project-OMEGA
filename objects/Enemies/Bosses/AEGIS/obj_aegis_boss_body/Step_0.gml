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
        // Arrived — lock position and start fighting
        x = target_x;
        y = target_y;
        entering = false;
        alarm[0] = shoot_delay; // begin shooting
    }
    
    // Don't aim yet during entry — keep a fixed angle for drama
    image_angle = 0;
} else {
    // Combat phase — aim at the player
	// Aim turret at the player (visual only — body stays stationary)
	
	if (instance_exists(obj_player)) {
		 // Always face the player
		var target_angle = point_direction(x, y, obj_player.x, obj_player.y);
		image_angle += angle_difference(target_angle, image_angle) * 0.1;
		//image_angle = point_direction(x, y, obj_player.x, obj_player.y);
	}
}