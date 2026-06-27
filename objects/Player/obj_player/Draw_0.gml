draw_self();

var timer_value = max(alarm[0], alarm[1]);
if(timer_value > 0)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);

	draw_text(x + 0, y + -60,  + string(round(timer_value / 60)));

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}