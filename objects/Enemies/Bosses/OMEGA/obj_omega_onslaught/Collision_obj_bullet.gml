with(other){ 
	instance_destroy();
}

if (state == 2) exit;

hp -= 1;
if (hp > 0) {
    image_blend = c_red;
    alarm[1] = 5;
} else {
    state = 2;
    sprite_index = sprite_transition;
    image_index = 0;
    state_timer = sprite_get_number(sprite_index) * (room_speed / sprite_get_speed(sprite_index));
    scr_clear_enemy_bullets();
    alarm[0] = -1; // ← cancel aimed shot
}