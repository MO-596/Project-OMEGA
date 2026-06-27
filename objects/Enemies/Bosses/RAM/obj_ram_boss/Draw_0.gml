draw_self();

// Telegraph the charge direction during AIM and WINDUP
if (state == 1 || state == 2) {
    var line_color = (state == 2) ? c_red : c_yellow; // red flash during windup
    var line_x = x + lengthdir_x(2000, image_angle);
    var line_y = y + lengthdir_y(2000, image_angle);

    draw_set_color(line_color);
    draw_set_alpha(0.5);
    scr_draw_pixel_line(x, y, line_x, line_y, 4);
    draw_set_alpha(1);
    draw_set_color(c_white);
}