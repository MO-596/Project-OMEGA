if (instance_exists(obj_player)) {
    //var dir_to_player = point_direction(x, y, obj_player.x, obj_player.y);
    //image_angle = dir_to_player;
	
    var target_angle = point_direction(x, y, obj_player.x, obj_player.y);
	image_angle += angle_difference(target_angle, image_angle) * 0.1;

    // Slowly advances, doesn't retreat
    direction = target_angle;
    speed = move_speed;
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
//move_wrap(1, 1, 50);
