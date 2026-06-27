// Cache before destroying
var bullet_x = other.x;
var bullet_y = other.y;

with(other){ 
	instance_destroy(); 
}

if (state == 0) {
	exit;    // silent during entry
}    

if (state == 2){ 
	exit; // can't be hit during transition
}

hp -= 1;
image_blend = c_red;
alarm[1] = 4; // flash on hit
	
if (hp <= 0) {
	// Start transition
	state = 2;
	sprite_index = sprite_transition;
	image_index = 0;
	state_timer = sprite_get_number(sprite_index) * (room_speed / sprite_get_speed(sprite_index));
	scr_clear_enemy_bullets();
	alarm[0] = -1; // no last-second volley fires during the death animation
}
