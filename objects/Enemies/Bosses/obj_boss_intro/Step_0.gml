display_time -= 1;

// Fade in for first 30 frames, fade out last 30 frames
if (display_time > 150) {
    fade_alpha = (180 - display_time) / 30;
} else if (display_time < 30) {
    fade_alpha = display_time / 30;
} else {
    fade_alpha = 1;
}

if (display_time <= 0) {
    instance_destroy();
}