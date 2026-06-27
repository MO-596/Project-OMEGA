if (instance_exists(obj_game)) {
    speed = obj_game.rock_speed;
}else if (instance_exists(obj_endless_game)) {
    speed = obj_endless_game.rock_speed;
}else {
    speed = 1;
}

image_angle = (random_range(0, 360));