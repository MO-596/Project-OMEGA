
// Black overlay 
draw_set_alpha(fade_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Only draw the dialog box once the fade is in
if (state >= 1 && state <= 2) {
	draw_set_font(fnt_bosses_intro);
	// Dialog box sprite
    draw_sprite(Dialog_Box, 0, box_x, box_y);
    // Text
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
	
	//Speaker Display tdxt
	draw_set_color(c_white);
	draw_text(box_x + 20, box_y + 12, lines[current_line].speaker);
	 
	//Actual Text Display
    draw_set_color(c_white);
	var line_height = string_height("A") + 4; // measures actual rendered height
    draw_text_ext(box_x + 20, box_y + 40, displayed_text, line_height, box_width - 40);

    // Continue prompt (only when line is finished)
    if (state == 2) {
        draw_set_halign(fa_right);
        var blink = (sin(current_time * 0.005) > 0); // pulses
        if (blink) {
            draw_text(box_x + box_width - 20, box_y + box_height - 30, "continue");
        }
    }
}
// Credits phase
if (state == 4) {
    // Black background already drawn by the overlay at top
    draw_set_font(fnt_bosses_intro);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(c_white);

    var center_x = display_get_gui_width() / 2;
    for (var i = 0; i < array_length(credits_lines); i++) {
        var ty = credits_scroll_y + (i * credits_line_height);
        if (ty > -credits_line_height && ty < display_get_gui_height()) {
            draw_text(center_x, ty, credits_lines[i]);
        }
    }

    // Skip hint
    draw_set_halign(fa_right);
    draw_set_color(c_gray);
    draw_text(display_get_gui_width() - 20, display_get_gui_height() - 30, "press space to skip");
    draw_set_color(c_white);
    draw_set_halign(fa_left);
}
// Reset
//draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//draw_set_font(-1); // reset to default font