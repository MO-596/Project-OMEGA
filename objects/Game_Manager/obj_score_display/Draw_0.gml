draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(room_width / 2, 150, "HIGH SCORES");

// Format endless time as M:SS
var mins = floor(best_time / 60);
var secs = floor(best_time mod 60);
var time_str = string(mins) + ":";
if (secs < 10) time_str += "0"; // zero-pad
time_str += string(secs);

draw_text(room_width / 2, 280, "Endless Mode Best Time");
draw_text(room_width / 2, 320, time_str);

draw_text(room_width / 2, 380, "Game Best Score");
draw_text(room_width / 2, 420, string(best_score_regular));

draw_text(room_width / 2, 480, "Endless Mode Best Score");
draw_text(room_width / 2, 520, string(best_score_endless));

draw_set_halign(fa_left);
draw_set_valign(fa_top);