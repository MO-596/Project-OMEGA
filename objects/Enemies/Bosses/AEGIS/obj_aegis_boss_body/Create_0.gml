hp = 15;             // total health
shoot_delay = 50;    // frames between shots

// --- Entry state ---
entering = true;
target_x = room_width / 2;
target_y = room_height / 2;
entry_speed = 2; // how fast it glides in

// Don't shoot yet — start shooting only after arrival

image_angle = 0;