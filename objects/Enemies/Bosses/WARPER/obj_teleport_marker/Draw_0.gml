var progress = 1 - (lifetime / max_lifetime); // 0 → 1 over its lifetime
var radius   = 40 + (progress * 20);          // expands as it counts down
var pulse    = 0.4 + sin(progress * pi * 6) * 0.3; // throbbing alpha
var pixel_size = 4; // can tweak this depending on the style we want — bigger = chunkier

// Outer warning ring
draw_set_color(c_red);
draw_set_alpha(pulse);
scr_draw_pixel_circle(x, y, radius, pixel_size, true);
scr_draw_pixel_circle(x, y, radius - pixel_size, pixel_size, true); // thicker ring


// Crosshair — snap to grid too so lines look pixel-y
draw_set_alpha(0.5);
scr_draw_pixel_line(x - radius, y, x + radius, y, pixel_size); // horizontal
scr_draw_pixel_line(x, y - radius, x, y + radius, pixel_size); // vertical

// Reset
draw_set_alpha(1);
draw_set_color(c_white);