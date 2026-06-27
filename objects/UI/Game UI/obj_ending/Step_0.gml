switch (state) {

    case 0: // FADE IN — darken screen
        fade_alpha = min(1, fade_alpha + fade_speed);
		if (fade_alpha >= 1) {
			// Pause briefly on black before dialog appears
			if (!variable_instance_exists(id, "pause_timer")) {
				pause_timer = 60; // 1 second of black
			}
			pause_timer--;
			if (pause_timer <= 0) {
				state = 1;
			}
		}
        break;

    case 1: // TYPEWRITER — reveal current line one char at a time
        char_index += char_speed;
        var line = lines[current_line].text;
        displayed_text = string_copy(line, 1, floor(char_index));

        // Line fully revealed?
        if (char_index >= string_length(line)) {
            displayed_text = line;
            state = 2;
        }

        // Player can skip the typewriter by pressing input
        if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)
            || mouse_check_button_pressed(mb_left)) {
            char_index = string_length(line);
            displayed_text = line;
            state = 2;
			audio_play_sound(snd_menu_click, 0, 0, 1.0);
        }
        break;

    case 2: // WAIT FOR INPUT — advance to next line
		show_debug_message("Waiting on line " + string(current_line) + " of " + string(array_length(lines)));
        if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)
            || mouse_check_button_pressed(mb_left)) {
				show_debug_message(">>> advancing <<<");
				audio_play_sound(snd_menu_click, 0, 0, 1.0);
				current_line++;
				char_index = 0;

				if (current_line >= array_length(lines)) {
					state = 3; // last line shown, exit
					state_timer = 30; // 1 second of black before credits
				} else {
					state = 1;
				}
        }
        break;

    case 3: // FADE OUT — go to credits / title
	// Hold on black for a beat, then go to credits
    state_timer--;
    if (state_timer <= 0) {
        room_goto(rm_credits);
    }
	/*
        fade_alpha = max(0, fade_alpha - fade_speed / 2); // slow fade
		show_debug_message("fade_alpha: " + string(fade_alpha));
        // Once fully faded, transition
        if (fade_alpha <= 0) {
            // Replace this with whatever you want next:
			room_goto(rm_credits);
			instance_destroy(); // ← clean up so we don't keep firing
            // room_goto(rm_title);
            //game_restart();
        }*/
        break;
/*    case 3: // FADE OUT — go to credits / title
        fade_alpha = max(0, fade_alpha - fade_speed / 2); // slow fade
		show_debug_message("fade_alpha: " + string(fade_alpha));
        // Once fully faded, transition
        
		if (fade_alpha <= 0) {
			state = 4; // credits phase
			credits_scroll_y = display_get_gui_height(); // start below screen
		}
        break;
	
	case 4:
		// CREDITS — scrolling text on black background
		credits_scroll_y -= credits_scroll_speed;

		// Player can skip with click or key
		if (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left)) {
			credits_scroll_y = credits_complete_y - 100; // jump to end
		}

		// Done scrolling — go back to menu
		if (credits_scroll_y < credits_complete_y) {
			global.menu_music_playing = false; // reset menu music flag
			room_goto(rm_menu);
			instance_destroy();
    }
		break;*/
}