// Don't spin during entry — try again in a second
if (entering) {
    alarm[2] = 60;
    exit;
}

// Trigger a spin burst
spinning = true;
spin_speed = choose(-7, -6, -4, 4, 6, 7); // random direction + speed
spin_frames_left = irandom_range(45, 90); // ~0.75 to 1.5 seconds