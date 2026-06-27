// Only fire during the attacking state
if (state != 3){ 
	exit
}

if (instance_exists(obj_player)) {
	var base_dir = point_direction(x, y, obj_player.x, obj_player.y);

	 // Fire 4 bullets in a spread
	 //makes the array dynamic, e.g. tighter on the first shot and wider on the second
	//var spread = [-12, -7, 7, 12];
	var spread = (volleys_fired == 0) ? [-8, -3, 3, 8] : [-15, -7, 7, 15];
	for (var i = 0; i < 4; i++) {
        var b = instance_create_layer(x, y, "Instances", obj_enemies_bullet);
        b.direction = base_dir + spread[i];
        b.image_angle = b.direction;
    }

    audio_play_sound(snd_enemy_shot, 0, 0, 1.0, undefined, random_range(0.4, 0.6));
}
volleys_fired++;

// Schedule next volley if more remain
if (volleys_fired < volleys_to_fire) {
    alarm[0] = shoot_delay;
}