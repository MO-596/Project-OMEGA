//--Health--
hp = 60;
max_hp = 60;

// --- Entry ---
entry_target_x = room_width / 2;
entry_target_y = room_height / 2;
entry_speed = 2;

// --- State machine ---
// 0 = entering, 1 = telegraphing (warning + fade out)
// 2 = teleporting in, 3 = attacking, 4 = idle (brief pause)
state = 0;
state_timer = 0;
target_x = room_width / 2;
target_y = room_height / 2;

// --- Tuning (frames; 60 = 1 second) ---
telegraph_time = 60;  // how long the warning circle shows
teleport_time = 10;  // fade-in time at new location
attack_duration = 60;  // time spent firing the 4-shot volley
idle_time = 30;  // pause after volley before next teleport
shoot_delay = 30;    // frames between shots
edge_margin = 100; // teleport stays this far from walls
volleys_to_fire = 2;  // how many spreads per attack phase
volleys_fired = 0;

// --- Internal ---
shots_fired = 0;
teleport_target_x = x;
teleport_target_y = y;
body_rotation_speed = 1; // degrees per frame, counter-clockwise

// --- Spawn the orbiting ring ---
ring = instance_create_layer(x, y, "Instances", obj_warper_rings);
ring.owner = id;

image_angle = 0;