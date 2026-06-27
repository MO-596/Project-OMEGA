// --- Dialog lines, shown one at a time ---
/*
lines = [
    "The OMEGA-PRIME core falls silent.",
    "After years of testing, the threat has been neutralized.",
    "The void is quiet again... for now.",
    "Thank you for playing."
];*/
show_debug_message("obj_credits Create running");

lines = [
    { speaker: "OMEGA:", text: "My time has come." },
	{ speaker: "OMEGA:", text: "But..." },
	{ speaker: "OMEGA:", text: "Will I be the final one?" },
	{ speaker: "OMEGA:", text: "Can you see them." },
	{ speaker: "OMEGA:", text: "The stars..." },
	{ speaker: "OMEGA:", text: "There beautiful." },
	{ speaker: "OMEGA:", text: "They will be here." },
	{ speaker: "OMEGA:", text: "SOON." },
];
current_line = 0;
char_index = 0;          // for typewriter effect
char_speed = 1.5;        // characters per frame
displayed_text = "";

// --- State machine ---
// 0 = fading in, 1 = showing text, 2 = waiting for input, 3 = fading out
state = 0;
fade_alpha = 0;
fade_speed = 0.008;

// --- Style ---
box_width = sprite_get_width(Dialog_Box);
box_height = sprite_get_height(Dialog_Box);
box_x = (display_get_gui_width() - box_width) / 2;
box_y = display_get_gui_height() - box_height - 60; // anchored to bottom

// Persistent so it survives the boss room
//persistent = true;
depth = -1000; // draw on top of everything


