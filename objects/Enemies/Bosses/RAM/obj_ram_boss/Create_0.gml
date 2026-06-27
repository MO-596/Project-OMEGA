// --- Health ---
hp = 50;
max_hp = 50; // useful for scaling difficulty as health drops

// --- Tuning (in frames; 60 = 1 second) ---
aim_time     = 90;   // 1.5s telegraph
windup_time  = 15;   // 0.25s locked-in flash
stun_time    = 120;  // 2s vulnerable window
charge_speed = 12;   // pixels per frame
charge_direction = 0; // locked in during windup
charge_origin_x = 0;
charge_origin_y = 0;
charge_distance = 0;
// Stored when entering windup so jitter doesn't drift the boss
windup_base_x = 0;
windup_base_y = 0;

// --- State machine ---
// 0 = entering, 1 = aiming, 2 = windup, 3 = charging, 4 = stunned
state = 0;
state_timer = 0;

// --- Entry state ---
target_x = room_width / 2;
target_y = room_height / 2;
entry_speed = 2; // how fast it glides in