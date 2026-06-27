// --- Health ---
hp = 35;
max_hp = 35;

// --- State ---
state = 1;
state_timer = 0;

// --- Mobility ---
dash_timer = 180;
dash_target_x = x;
dash_target_y = y;
dashing = false;

// --- Idle drift (between dashes) ---
drift_speed = 1.2;
drift_dir = random(360);

// --- Kamikaze spawning ---
kamikaze_spawn_timer = 12 * 60;

// --- Firing ---
shoot_delay = 90; // 1.5s between volleys
alarm[0] = shoot_delay;
locked_bullets = ds_list_create();// Locked bullets (visually attached to barrels during charge-up)
barrel_dist = 24;
// --- Transition ---
sprite_normal = OMEGA_ONSLAUGHT;
sprite_transition = combat_to_meltdown;
sprite_index = sprite_normal;

// --- Positioning ---
entry_target_x = room_width / 2;
entry_target_y = room_height / 3;