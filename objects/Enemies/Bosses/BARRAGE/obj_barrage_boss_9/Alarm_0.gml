if (instance_exists(obj_player)) {
	var base_dir = point_direction(x, y, obj_player.x, obj_player.y);

	//TODO: make it shoot 6 bullets and 
	 // Fire 6 bullets in a spread
	 //var spread = [-15, 0, 15];
    //var spread = [-25, -15, -5, 5, 15, 25];
	var spread = [-12, -7, -2, 2, 7, 12];
	for (var i = 0; i < 6; i++) {
        var b = instance_create_layer(x, y, "Instances", obj_enemies_bullet);
        b.direction = base_dir + spread[i];
        b.image_angle = b.direction;
    }

    audio_play_sound(snd_enemy_shot, 0, 0, 1.0, undefined, random_range(0.4, 0.6));
}
alarm[0] = shoot_delay;