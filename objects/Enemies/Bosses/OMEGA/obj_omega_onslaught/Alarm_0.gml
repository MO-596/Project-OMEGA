if (state != 1){ 
	exit;
}

if (instance_exists(obj_player)) {
	//var barrel_dist = 24; // how far from center each barrel 
	var barrel_offset = -60; // offset to match the sprite

	for (var i = 0; i < 6; i++) {
		var shot_angle = image_angle + barrel_offset + (i * 60); // 360/6 = 60

        // Spawn at the rim, not the center
        var spawn_x = x + lengthdir_x(barrel_dist, shot_angle);
        var spawn_y = y + lengthdir_y(barrel_dist, shot_angle);
		var b = instance_create_layer(spawn_x, spawn_y, "Instances", obj_enemies_bullet);
		b.direction = shot_angle;
		b.image_angle = b.direction;
		b.speed = 0; // ensures they don't appear "stuck" at the rim for a frame
		
		// Track this bullet so the boss's Step event keeps it glued
        var entry = {
            bullet: b,
            offset_angle: shot_angle - image_angle, // angle relative to body
            frames: 4 // glued for 4 frames, then released
        };
        ds_list_add(locked_bullets, entry);
	}

    audio_play_sound(snd_shoot, 0, 0, 0.9, undefined, random_range(0.7, 0.9));
}

alarm[0] = shoot_delay;