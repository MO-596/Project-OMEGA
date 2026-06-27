
if (instance_exists(obj_player)) {
    // Always face the player
	var target_angle = point_direction(x, y, obj_player.x, obj_player.y);
	image_angle += angle_difference(target_angle, image_angle) * 0.1;
	
    // --- Movement style ---
    // Keep distance (hover and circle)
    var dist = point_distance(x, y, obj_player.x, obj_player.y);
    if (dist > 400) {
        // Too far — move closer
        direction = target_angle;
        speed = move_speed;
    } else if (dist < 250) {
        // Too close — back away
        direction = target_angle + 180;
        speed = move_speed;
    } else {
        // Good distance — strafe sideways
        direction = target_angle + 90;
        speed = move_speed * 0.7;
    }
}
// Only wrap once we've entered the room
if (variable_instance_exists(id, "spawning") && spawning) {
    // Are we inside the room? If yes, turn off the spawning flag.
    if (x > 0 && x < room_width && y > 0 && y < room_height) {
        spawning = false;
    }
} else {
    move_wrap(1, 1, 100);
}

image_angle += 1; // existing rotation

