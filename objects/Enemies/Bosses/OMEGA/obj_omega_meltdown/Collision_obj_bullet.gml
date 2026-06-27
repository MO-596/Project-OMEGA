
with(other){
	instance_destroy(); // destroy bullet
}
hp -= 1;
// Flash red on hit (only visible if it survives)
if (hp > 0) {
    image_blend = c_red;
    alarm[1] = 5; // reset color after 5 frames
}

if (hp <= 0 && state == 1) {
// Enter dying state
    state = 2;

    sprite_index = sprite_death;
    image_index = 0;
    image_speed = 1;
	 audio_play_sound(omega_death_snd, 0, 0, 1.2, undefined, 0.5); // omega death sound
    // Auto-match the death timer to the animation length
    death_duration = sprite_get_number(sprite_index) * (game_get_speed(gamespeed_fps) / sprite_get_speed(sprite_index));
    death_timer = death_duration;

    // Stop all attacks immediately
    shockwave_active = false;
    shockwave_charging = false;
//global.boss_active = false;
    // Clear bullets so the player has a clean victory moment
    scr_clear_enemy_bullets();
    //scr_destroy_target(10000, snd_rockdestroy, false);
	//scr_restore_default_music();
}