
// Black background
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1); // ensure full opacity
/*
// DIAGNOSTIC — should always show a red square in the top-left
draw_set_color(c_red);
draw_rectangle(50, 50, 150, 150, false);

draw_set_color(c_lime);
draw_circle(200, 100, 30, false);

draw_set_color(c_white);

show_debug_message(">>> obj_credits Draw GUI running");
draw_set_font(fnt_bosses_intro); // ← font set AFTER the test
draw_set_color(c_red);
draw_text(100, 100, "TEST");    // ← uses whatever font was last set

*/
// Scrolling text
draw_set_font(fnt_bosses_intro);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

var center_x = display_get_gui_width() / 2;
for (var i = 0; i < array_length(credits_lines); i++) {
    var ty = scroll_y + (i * line_height);
    if (ty > -line_height && ty < display_get_gui_height()) {
        draw_text(center_x, ty, credits_lines[i]);
    }
}

// Skip hint
draw_set_halign(fa_right);
draw_set_color(c_gray);
draw_text(display_get_gui_width() - 20, display_get_gui_height() - 30, "press space to skip");

// Reset
draw_set_font(-1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);