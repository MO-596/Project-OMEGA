/// @function draw_pixel_line(x1, y1, x2, y2, pixel_size)
/// @param {real} x1, y1      Start point
/// @param {real} x2, y2      End point
/// @param {real} pixel_size  Block size (match your other pixel draws)
function scr_draw_pixel_line(x1, y1, x2, y2, pixel_size) {
    var dist  = point_distance(x1, y1, x2, y2);
    var steps = ceil(dist / pixel_size);
    var dir   = point_direction(x1, y1, x2, y2);

    for (var i = 0; i <= steps; i++) {
        var px = x1 + lengthdir_x(i * pixel_size, dir);
        var py = y1 + lengthdir_y(i * pixel_size, dir);

        // Snap to a pixel grid so blocks step like a real pixel line
        px = floor(px / pixel_size) * pixel_size;
        py = floor(py / pixel_size) * pixel_size;

        draw_rectangle(px, py, px + pixel_size - 1, py + pixel_size - 1, false);
    }
}