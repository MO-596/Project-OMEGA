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
    image_angle = 0;
} else {
	// Combat phase — sway side-to-side
    sway_timer += sway_speed;
    x = target_x + sin(sway_timer) * sway_amount_x;
	y = target_y + cos(sway_timer * 0.7) * sway_amount_y;
    // y stays at target_y (no vertical sway)
	
// Spin visual
    if (spinning) {
        image_angle += spin_speed;
        spin_frames_left -= 1;
        if (spin_frames_left <= 0) {
            spinning = false;
            // Sprite is 4-way symmetric — snap to nearest 90° so it ends cleanly
            image_angle = round(image_angle / 90) * 90;
            alarm[2] = irandom_range(240, 480); // next spin: 4-8 seconds
        }
    }
}