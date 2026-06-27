// Difficulty scales with how long you've survived
var difficulty = survival_time / 30; // ramps up every 30 seconds

// Rocks get faster over time
rock_speed = 1 + (difficulty * 0.3);

// Always spawn a rock (but cap total rocks so they don't flood)
if (instance_number(obj_rock) < 12) {
    scr_spawn_offscreen(obj_rock);
}

// Count current enemies so we can cap them
var enemy_count = instance_number(obj_enemy_parent);


// After 30 sec, add shooter (rare, capped)
if (survival_time > 30 && enemy_count < 4 && irandom(2) == 0) {
    scr_spawn_offscreen(obj_enemy_shooter);
}

// After 60 sec, add kamikaze (rarer)
if (survival_time > 60 && enemy_count < 5 && irandom(3) == 0) {
    scr_spawn_offscreen(obj_enemy_kamikaze);
}

// After 90 sec, add brute (rarest)
if (survival_time > 90 && enemy_count < 6 && irandom(5) == 0) {
    scr_spawn_offscreen(obj_enemy_brute);
}

// Spawn faster as time goes on (min 50 frames so it never gets insane)
spawn_delay = max(50, 120 - floor(survival_time / 4));
alarm[2] = spawn_delay; // re-arm the spawner