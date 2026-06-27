
if (instance_exists(obj_player)) {
    // Create an enemy bullet aimed at player
    var b = instance_create_layer(x, y, "Instances", obj_enemies_bullet);
    b.direction = point_direction(x, y, obj_player.x, obj_player.y);
    b.image_angle = b.direction;
    
    audio_play_sound(snd_enemy_shot, 0, 0, 1.0, undefined, random_range(0.7, 0.9));
}

// Reset timer for next shot
alarm[0] = shoot_delay;