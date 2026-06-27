show_debug_message("obj_credits Step running");
scroll_y -= scroll_speed;
display_time++;

var last_line_y = scroll_y + ((array_length(credits_lines) - 1) * line_height);
if (last_line_y < -50 && !variable_instance_exists(id, "fading_out")) {
    fading_out = true;
    audio_sound_gain(credits_music, 0, 1000);
    alarm[0] = 60;
}

// Player can skip at any time
if (keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_left)) {
    if (!variable_instance_exists(id, "fading_out")) {
        fading_out = true;
        audio_sound_gain(credits_music, 0, 1000);
        alarm[0] = 60;
    }
}

/*
// Auto-return after delay, OR if player presses any key
if (display_time > auto_return_delay
    || keyboard_check_pressed(vk_anykey)
    || mouse_check_button_pressed(mb_left)) {
	//TODO: CREDITS END TOO ERLY
	/*
	if (audio_is_playing(credits_music)) {
        audio_stop_sound(credits_music);
    }
// Calculate where the last line is right now
var last_line_y = scroll_y + ((array_length(credits_lines) - 1) * line_height);

// Auto-fade when last line scrolls off the top
if (last_line_y < -50 && !variable_instance_exists(id, "fading_out")) {
    fading_out = true;
    audio_sound_gain(credits_music, 0, 1000);
    alarm[0] = 60;
}
   //global.menu_music_playing = false;
    //audio_stop_all();

    global.menu_music_playing = false;
    room_goto(rm_menu);
}*/