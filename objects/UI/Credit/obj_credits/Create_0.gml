show_debug_message(">>> obj_credits CREATE running");

credits_lines = [
	"Rock Breaker",
	"",
    "A game by TyrannoDevStudios",
    "",
    "Programming:",
	"Melvin Ocampo",
	"",
    "Art:",
	" Melvin Ocampo & GameMaker",
	"",
    "Sound Effects:",
	"",
	"Melvin Ocampo", 
	"Kronbits", 
	"bfxr.net", 
	"GameMaker",
	"Levi Vilas Boas",
	"",
	"Music:",
	"8Bit Adventure by Tim Beek",
	"Game_Music by GameMaker",
	"end_credits by Melvin Ocampo",
	"Level 1 by Juhani Junkala",
	"Level 2 by Juhani Junkala",
	"Level 3 by Juhani Junkala",
	"Boss_battle #2 by nene",
	"Boss Battle 6 V1 by nene",
	"Orbital Colossus by Matthew Pablo",
	"",
    "Made in GameMaker",
    "",
    "Thanks for playing!",
	"",
	"More will come soon!!!"];

	//TODO: Format this so it doesn't go out of bounds
scroll_y = display_get_gui_height(); // start text below screen
scroll_speed = 1;                   // pixels per frame
display_time = 0;                     // tracks how long credits have been shown
auto_return_delay = 60 * 25;          // 25 seconds before auto-returning
line_height = 32;
//complete_y = -(array_length(credits_lines) * line_height) - 100;

credits_music = audio_play_sound(end_credits, 5, true);
audio_sound_gain(credits_music, 0, 0);      // immediately set to silent
audio_sound_gain(credits_music, 0.7, 2000); // fade up to 70% over 2 seconds