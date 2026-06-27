ghost_active = false;
// Reset color, but keep spread's color if it's still active
if (spread_active) {
    image_blend = c_yellow;
	image_alpha = 1;
} else {
    image_blend = c_white;
    image_alpha = 1;
}