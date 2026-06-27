if (instance_exists(obj_player)) {
    var base_dir = point_direction(x, y, obj_player.x, obj_player.y);
  
    // Fire 3 bullets in a spread
    var spread = [-15, 0, 15];
    for (var i = 0; i < 3; i++) {
        var b = instance_create_layer(x, y, "Instances", obj_enemies_bullet);
        b.direction = base_dir + spread[i];
        b.image_angle = b.direction;
    }
    audio_play_sound(snd_enemy_shot, 0, 0, 1.0, undefined, random_range(0.5, 0.9));
    
}
alarm[0] = shoot_delay;