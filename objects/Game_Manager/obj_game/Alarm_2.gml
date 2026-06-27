// ============================================================
// LEVEL SPAWN LOGIC
// ============================================================

// ------------------------------------------------------------
// BOSS LEVELS — custom setup, skip everything below
//Boss Fight - AEGIS
if (level == 5) {
    // Show intro card
    scr_spawn_boss_intro("AEGIS-1");
    // Play Boss music
	scr_swap_music(Level_1);
	global.boss_active = true;
	
    // Spawn boss in center
    var boss = instance_create_layer(room_width / 2, -150, "Instances", obj_aegis_boss_body);
    instance_create_layer(boss.x, boss.y, "Instances", obj_aegis_boss_shield);
    
    // Spawn 2 shooter helpers off-screen
    repeat(2) {
        scr_spawn_offscreen(obj_enemy_shooter);
    }
    
    level_message_timer = 0; // don't show "LEVEL 5" — the intro card replaces it
    exit; // skip the normal spawn code below
}

//Boss Fight - BARRAGE
if (level == 10) {
    // Show intro card
    scr_spawn_boss_intro("BARRAGE-9");
        // Play Boss music
	scr_swap_music(Level_2);
	global.boss_active = true;
	
    // Spawn boss in center
    var boss = instance_create_layer(room_width / 2, -150, "Instances", obj_barrage_boss_9);
    
    // Spawn 2 shooter helpers off-screen
    repeat(1) {
        scr_spawn_offscreen(obj_enemy_brute);
    }
    
    level_message_timer = 0; // don't show "LEVEL 5" — the intro card replaces it
    exit; // skip the normal spawn code below
}

//Boss Fight - MIRROR
if (level == 15) {
    // Show intro card
    scr_spawn_boss_intro("MIRROR-X");
    // Play Boss music
	scr_swap_music(Level_3);
	global.boss_active = true;
	
    // Spawn boss in center
    var boss = instance_create_layer(room_width / 2, -150, "Instances", obj_mirror_x_boss);
    
    level_message_timer = 0; // don't show "LEVEL 5" — the intro card replaces it
    exit; // skip the normal spawn code below
}

//Boss Fight - RAM
if(level == 20){
	// Show intro card
    scr_spawn_boss_intro("RAM-7");
	// Play Boss music
	scr_swap_music(boss_battle_2);
	global.boss_active = true;
	
	 // Spawn boss in center
    var boss = instance_create_layer(room_width / 2, -150, "Instances", obj_ram_boss);
    
    level_message_timer = 0; // don't show "LEVEL 5" — the intro card replaces it
    exit; // skip the normal spawn code below
}

if(level == 25){
	// Show intro card
    scr_spawn_boss_intro("WARPER-3");
	// Play Boss music
	scr_swap_music(Boss_Battle_6_V1);
	global.boss_active = true;
	
	 // Spawn boss in center
    var boss = instance_create_layer(room_width / 2, -150, "Instances", obj_warper_3);
    instance_create_layer(boss.x, boss.y, "Instances", obj_warper_rings);
    level_message_timer = 0; // don't show "LEVEL 5" — the intro card replaces it
    exit; // skip the normal spawn code below
}

if(level == 30){
	// Show intro card
    scr_spawn_boss_intro("OMEGA");
	 // Play Boss music
	scr_swap_music(Orbital_Colossus);
	global.boss_active = true;
	
	var boss = instance_create_layer(room_width / 2, -150, "Instances", obj_omega_core);
	instance_create_layer(boss.x, boss.y, "Instances", obj_omega_rings);
	
	level_message_timer = 0; // don't show "LEVEL 5" — the intro card replaces it
    exit; // skip the normal spawn code below
}
// ------------------------------------------------------------
// NORMAL LEVELS
// ------------------------------------------------------------
level_message_timer = 120; // show "LEVEL X" for 2 seconds
rock_speed = 1 + (level * 0.15); // level 1=1.5, level 2=2.0, level 3=2.5

// --- Rocks per level (0 = enemies-only wave, no rocks spawn) ---
// Index = level. Tweak any value to adjust that level's difficulty.
var rocks_table = [
    0,                       // unused (level 0)
    3,  4,  5,  6,  0,       // levels 1-5    (5 = BOSS)
    0,  8,  10, 0,  0,       // levels 6-10   (6, 9 = enemies-only; 10 = BOSS)
    11, 0,  12, 0,  0,       // levels 11-15  (12, 14 = enemies-only; 15 = BOSS)
    13, 0,  14, 0,  0,       // levels 16-20  (17, 19 = enemies-only; 20 = BOSS)
    15, 0,  16, 0,  0,       // levels 21-25  (22, 24 = enemies-only; 25 = BOSS)
    16, 0,  17, 18, 0        // levels 26-30  (27 = enemies-only; 30 = BOSS)
];

// --- Enemy spawn tables (index = level, value = count, 0 = none)
// Tweak any value to adjust that level's difficulty.
//Final column will be ignore for the boss fights
var shooters_table = [
    0,                       // unused (level 0)
    0,  0,  1,  1,  0,       // levels 1-5
    2,  0,  2,  3,  0,       // levels 6-10   (7 = rocks-only)
    0,  3,  2,  4,  0,       // levels 11-15  (11 = rocks-only)
    3,  4,  3,  5,  0,       // levels 16-20
    4,  5,  3,  6,  0,       // levels 21-25
    4,  6,  3,  5,  0        // levels 26-30
];

var kamikaze_table = [
    0,                       // unused (level 0)
    0,  0,  0,  0,  0,       // levels 1-5
    2,  0,  1,  3,  0,       // levels 6-10
    0,  3,  1,  2,  0,       // levels 11-15
    1,  2,  2,  3,  0,       // levels 16-20
    2,  3,  2,  3,  0,       // levels 21-25
    2,  3,  3,  3,  0        // levels 26-30
];

var brute_table = [
	0,                       // unused (level 0)
    0,  0,  0,  0,  0,       // levels 1-5
    0,  0,  1,  2,  0,       // levels 6-10
    0,  2,  1,  2,  0,       // levels 11-15
    1,  2,  2,  3,  0,       // levels 16-20
    1,  3,  2,  3,  0,       // levels 21-25
    2,  3,  3,  3,  0        // levels 26-30
];

// --- Rock Spawn ---
repeat(rocks_table[level]) { 
	scr_spawn_offscreen(obj_rock);
	}	
	
//--- Shooters: unlock at L3, +1 every 2 levels, capped at 12 ---

repeat(shooters_table[level]) { 
	scr_spawn_offscreen(obj_enemy_shooter); 
}

// --- Kamikazes: start at level 6 +1 every 2 levels, capped at 8 ---
repeat(kamikaze_table[level]) { 
	scr_spawn_offscreen(obj_enemy_kamikaze);
}

// --- Brutes: start at level 7 +1 every 2 levels, capped at 7 ---
repeat(brute_table[level]){ 
	scr_spawn_offscreen(obj_enemy_brute);    
}
