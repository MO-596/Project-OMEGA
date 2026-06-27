// Only wrap once we've entered the room
if (variable_instance_exists(id, "spawning") && spawning) {
    // Are we inside the room? If yes, turn off the spawning flag.
    if (x > 0 && x < room_width && y > 0 && y < room_height) {
        spawning = false;
    }
} else {
    move_wrap(1, 1, 100);
}

image_angle += 1;