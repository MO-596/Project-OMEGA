// --- Health ---
hp = 25;
max_hp = 25;

// --- State ---
// 0 = entering, 1 = active, 2 = dying transition
state = 0;
state_timer = 0;

// --- Entry ---
entry_target_x = room_width / 2;
entry_target_y = room_height / 3;
entry_speed = 2;

// --- Attack
// --- Firing ---
shoot_delay = 90; // 1.5s between volleys
alarm[0] = shoot_delay;

// --- Shield ---
shield_angle = 0;
shield_rotation_speed = 1.5;
//shield_arc = 90; // bullets in this arc are blocked

// --- Drifting ---
drift_speed = 0.5;
drift_dir = random(360);

// --- Helper spawning ---
helper_spawn_timer = 8 * 60;

// --- Transition ---
sprite_normal = OMEGA_CORE;
sprite_transition = rings_to_combat;
//sprite_index = sprite_normal;