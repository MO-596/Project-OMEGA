spread_active = false;
if (ghost_active) {
    image_blend = $52FFFFFF & $ffffff;
    image_alpha = ($52FFFFFF >> 24) / $ff;
} else {
    image_blend = c_white;
    image_alpha = 1;
}