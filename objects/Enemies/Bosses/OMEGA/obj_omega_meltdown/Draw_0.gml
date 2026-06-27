draw_self();

// Charge-up warning — pulsing ring around the boss
if (shockwave_charging) {
    var charge_progress = 1 - (shockwave_charge_timer / shockwave_charge_duration);
    var warn_radius = 30 + charge_progress * 30; // grows from 30 to 60
    var warn_alpha = 0.3 + (sin(shockwave_charge_timer * 0.5) * 0.4); // pulses

    draw_set_color(c_red);
    draw_set_alpha(warn_alpha);
    scr_draw_pixel_circle(x, y, warn_radius, 4, true);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

// Draw the shockwave ring
if (shockwave_active) {
    // Fade as it nears its end
    var fade = 1 - (shockwave_radius / max_shockwave_radius);
    draw_set_color(c_red);
    draw_set_alpha(0.6 * fade);
    scr_draw_pixel_circle(x, y, shockwave_radius, 4, true);
    scr_draw_pixel_circle(x, y, shockwave_radius - 4, 4, true);
    draw_set_alpha(1);
    draw_set_color(c_white);
}