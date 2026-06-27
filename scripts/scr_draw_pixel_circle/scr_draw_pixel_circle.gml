/// @function draw_pixel_circle(cx, cy, radius, pixel_size, outline)
/// @param {real} cx           Center x
/// @param {real} cy           Center y
/// @param {real} radius       Circle radius
/// @param {real} pixel_size   Size of each "pixel" block (4 = chunky, 1 = subtle)
/// @param {bool} outline      True = ring outline, false = filled disc
function scr_draw_pixel_circle(cx, cy, radius, pixel_size, outline) 
{
if (outline) {
        // Walk around the circumference plotting pixel-sized squares
        var steps = ceil(2 * pi * radius / pixel_size);
        for (var i = 0; i < steps; i++) {
            var angle = (i / steps) * 360;
            var px = floor((cx + lengthdir_x(radius, angle)) / pixel_size) * pixel_size;
            var py = floor((cy + lengthdir_y(radius, angle)) / pixel_size) * pixel_size;
            draw_rectangle(px, py, px + pixel_size - 1, py + pixel_size - 1, false);
        }
    } else {
        // Filled — fill a grid of pixels inside the radius
        var r2 = radius * radius;
        for (var ox = -radius; ox <= radius; ox += pixel_size) {
            for (var oy = -radius; oy <= radius; oy += pixel_size) {
                if (ox*ox + oy*oy <= r2) {
                    var px = floor((cx + ox) / pixel_size) * pixel_size;
                    var py = floor((cy + oy) / pixel_size) * pixel_size;
                    draw_rectangle(px, py, px + pixel_size - 1, py + pixel_size - 1, false);
                }
            }
        }
    }
}