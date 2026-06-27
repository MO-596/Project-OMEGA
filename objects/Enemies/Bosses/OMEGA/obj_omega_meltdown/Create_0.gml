// --- Health ---
hp = 30;
max_hp = 30;

// --- State ---
state = 1;

// --- Phase 3 mechanics ---
pulse_timer = 60;
shockwave_timer = 5 * 60;
shockwave_radius = 0;
shockwave_active = false;
desperation = false;
// Shockwave indicador
shockwave_charging = false;
shockwave_charge_timer = 0;
shockwave_charge_duration = 60; // 1s warning before it fires
max_shockwave_radius = 500; // wave caps out here, no matter the room

// --- Drifting ---
drift_speed = 1.2;
drift_dir = random(360);

// --- Death sequence ---
death_timer = 0;
death_explosion_timer  = 0; // grows over the sequence for intensifying shake
death_duration = 0;
sprite_death = OMEGA_DEATH_1; // replace with your actual death animation sprite name

sprite_index = OMEGA_MELTDOWN;