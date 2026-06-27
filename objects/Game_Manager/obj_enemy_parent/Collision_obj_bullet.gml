hp -= 1;
with(other){
	instance_destroy(); // destroy bullet
}

// Flash red on hit (only visible if it survives)
if (hp > 0) {
    image_blend = c_red;
    alarm[1] = 5; // reset color after 5 frames
}

if (hp <= 0) {
    scr_destroy_target(100, snd_rockdestroy, false);
}