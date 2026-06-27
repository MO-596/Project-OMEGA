draw_set_alpha(fade_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_red);

draw_set_font(fnt_bosses_intro);
draw_text(room_width / 2, room_height / 2, "INCOMING: " + boss_name);

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);