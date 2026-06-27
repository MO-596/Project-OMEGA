if (instance_exists(obj_player)) {
    var b = instance_create_layer(x, y, "Instances", obj_enemies_bullet);
    b.direction = point_direction(x, y, obj_player.x, obj_player.y);
    b.image_angle = b.direction;
	// Faster bullets than other bosses — makes them harder to dodge mid-mirror
    b.speed = 8;
    audio_play_sound(snd_enemy_shot, 0, 0, 1.0, undefined, random_range(0.4, 0.6));
}
alarm[0] = shoot_delay;