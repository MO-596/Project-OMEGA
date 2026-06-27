draw_set_font(fnt_bosses_intro);
draw_text(10, 10, string(points) + ""); // Displays the Points that the player has intotal

draw_text(10, 40, string(Lives) + ""); // Displays the amount of lives the player has

var m = floor(survival_time / 60);
var s = floor(survival_time mod 60);
var t = string(m) + ":";
if (s < 10) t += "0";
t += string(s);

draw_set_halign(fa_center);
draw_text(room_width / 2, 30, t);
draw_set_halign(fa_left);

// Game Over overlay
if (game_over) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
	
    draw_text(room_width / 2, room_height / 2, "GAME OVER");
	
	// Stack the "new best" messages below GAME OVER
    var msg_y = room_height / 2 + 60;
	
	if (new_best_time) {
        draw_text(room_width / 2, msg_y, "NEW BEST TIME!");
        msg_y += 40; // push the next message down
    }
    
    if (new_best_score) {
        draw_text(room_width / 2, msg_y, "NEW BEST SCORE!");
    }
	
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}