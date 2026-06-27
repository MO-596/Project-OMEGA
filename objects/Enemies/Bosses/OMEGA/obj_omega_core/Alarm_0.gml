// Only fire while active
if (state != 1) {
	exit;
}

if (instance_exists(obj_player)) {
	var base_dir = point_direction(x, y, obj_player.x, obj_player.y);

    var spread = [-15, -5, 5, 15];
    for (var i = 0; i < 4; i++) {
        var b = instance_create_layer(x, y, "Instances", obj_enemies_bullet);
        b.direction = base_dir + spread[i]; // straight down spread
        b.image_angle = b.direction;
    }
    audio_play_sound(snd_shoot, 0, 0, 1.0, undefined, random_range(0.6, 0.8));
}

alarm[0] = shoot_delay;