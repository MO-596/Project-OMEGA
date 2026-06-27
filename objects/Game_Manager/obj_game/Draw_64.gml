if (instance_exists(obj_ending)){ 
	exit;
}
if (room == rm_menu || room == rm_credits || room == rm_ending){
	exit;
}
draw_set_font(fnt_bosses_intro);
draw_text(10, 10, string(points) + ""); // Displays the Points that the player has intotal

draw_text(10, 40, string(max(0, Lives)) + ""); // Displays the amount of lives the player has
draw_text(10, 70, "Level: " + string(level)); // Displays the wave number
draw_text(10, 100, "Rocks: " + string(instance_number(obj_rock))); // Displays remaining rocks in the wave

// Wave announcement
if (level_message_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(room_width / 2, room_height / 2, "LEVEL " + string(level));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

// Game Over overlay
if (game_over) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    if (Lives <= 0) {
        draw_text(room_width / 2, room_height / 2, "GAME OVER");
    } else {
        draw_text(room_width / 2, room_height / 2, "YOU WIN!");
    }
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}