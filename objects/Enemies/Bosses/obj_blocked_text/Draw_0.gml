draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_bosses_intro);
draw_set_alpha(life / max_life); // fades out
draw_set_color(text_color);
draw_text(x, y, text);

// Reset for other draw calls
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
