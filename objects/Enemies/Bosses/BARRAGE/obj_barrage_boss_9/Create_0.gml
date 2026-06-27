//--Health
hp = 50;             // total health
shoot_delay = 50;    // frames between shots

// --- Entry state ---
entering = true;
target_x = room_width / 2;
target_y = room_height / 2;
entry_speed = 2; // how fast it glides in
image_angle = 0;

// Don't shoot yet — start shooting only after arrival
// --- Sway state (used after arrival) ---
sway_amount_x= 150;   // pixels left/right from center
sway_amount_y = 80;  // pixels up/down from center (smaller so it doesn't drop into the player)
sway_speed = 0.015;  // how fast it sways (lower = slower)
sway_timer = 0;      // internal counter

// --- Spin visual (combat phase only) ---
spinning = false;
spin_frames_left = 0;
spin_speed = 0; // degrees/frame, randomized when a spin starts
alarm[2] = irandom_range(180, 360); // first spin: 3-6 seconds after spawn