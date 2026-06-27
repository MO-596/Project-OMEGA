// --- DYING STATE ---
if (state == 2) {
    death_timer--;
//TODO: ADD EXPLOSION SOUND EFFECTS FOR THE DEATH BY STOPPING THE MUSIC AND ONLY HAVE 
//THOSE SFX PLAY p.S. CREATE EXPLOSION EFFECTS
    // Subtle jitter — the body is failing
    x += random_range(-3, 3);
    y += random_range(-3, 3);

    // Cascade of small explosions across the body
    death_explosion_timer--;
    if (death_explosion_timer <= 0) {
        var ex = x + random_range(-30, 30);
        var ey = y + random_range(-30, 30);
        effect_create_depth(depth, obj_particles, ex, ey, 1, c_white);
        audio_play_sound(snd_rockdestroy, 0, 0, 0.5, undefined, random_range(0.8, 1.4));

        var progress = 1 - (death_timer / death_duration);
        death_explosion_timer = max(3, 20 - floor(progress * 15));
    }

    // Final detonation
    if (death_timer <= 0) {
        // Big finale — bigger particles, white flash
        repeat(8) {
            var ex = x + random_range(-40, 40);
            var ey = y + random_range(-40, 40);
            effect_create_depth(depth,obj_particles, ex, ey, 2, c_white);
        }
        with(obj_particles) {
            part_particles_create(ps, other.x, other.y, pt_rock, 50);
        }
		scr_destroy_target(10000, snd_rockdestroy, false);
		
		// Stop the boss music and start ending
		if (global.manager.current_music != undefined) {
			audio_stop_sound(global.manager.current_music);
			global.manager.current_music = undefined;
		}
		// Stop all music
		audio_stop_all();
		var death_sprite = instance_create_layer(x, y,
                                                   "Instances", OMEGA_DEATH_1);	
        //scr_destroy_target(10000, snd_rockdestroy, false);
		// Defensive: kill any untracked snd_game_music instance
        //audio_stop_sound(snd_game_music);
		// Go to the ending room — obj_ending lives there
		room_goto(rm_ending);
		//instance_create_layer(0, 0, "Instances", obj_ending);
        //scr_restore_default_music();
    }

    exit; // skip the rest of step while dying
}

if (state != 1){
	exit;
}

// Drift across the room
var current_drift = desperation ? drift_speed * 2 : drift_speed;
x += lengthdir_x(current_drift, drift_dir);
y += lengthdir_y(current_drift, drift_dir);

// Bounce off bounds
if (x < 150 || x > room_width - 150) drift_dir = 180 - drift_dir;
if (y < 100 || y > room_height / 2)  drift_dir = -drift_dir;

// Erratic course corrections — more frequent when desperate
var correction_chance = desperation ? 15 : 40;
if (irandom(correction_chance) == 0) {
    drift_dir += random_range(-45, 45);
}

// Unstable jitter ON TOP of the drift
x += random_range(-1, 1);
y += random_range(-1, 1);

// Safety clamp so jitter can't push it out of bounds
x = clamp(x, 150, room_width - 150);
y = clamp(y, 100, room_height / 2);

// Desperation kicks in below 25% HP
if (!desperation && hp <= max_hp * 0.25) {
    desperation = true;
}
// --- Pulse bullets — PAUSED while shockwave is firing or charging ---
// Slow radial pulse bullets
if (!shockwave_active && !shockwave_charging) {
    pulse_timer--;
    var pulse_interval = desperation ? 30 : 60;
    if (pulse_timer <= 0) {
        var offset = random(45);
        for (var i = 0; i < 12; i++) {
            var b = instance_create_layer(x, y, "Instances", obj_enemies_bullet);
            b.direction = i * 30 + offset;
            b.image_angle = b.direction;
            b.speed = 3;
        }
        pulse_timer = pulse_interval;
    }
}

// Shockwave logic
//shockwave_timer--;
var shockwave_interval = desperation ? 3 * 60 : 5 * 60;

// Start charging up
// Only tick the cooldown when idle (not charging, not firing)
if (!shockwave_active && !shockwave_charging) {
    shockwave_timer--;
    if (shockwave_timer <= 0) {
        shockwave_charging = true;
        shockwave_charge_timer = shockwave_charge_duration;
        audio_play_sound(snd_shoot, 0, 0, 0.8, undefined, 0.4);
    }
}

// Charging — visible warning, not dangerous yet
if (shockwave_charging) {
    shockwave_charge_timer--;
    if (shockwave_charge_timer <= 0) {
        shockwave_charging = false;
        shockwave_active = true;
        shockwave_radius = 0;
        audio_play_sound(omega_arlet_snd, 0, 0, 1.2, undefined, 0.5); // boom!
    }
}

if (shockwave_active) {
    shockwave_radius += 4;
	// Only check kill while still in lethal range
    if (instance_exists(obj_player) && shockwave_radius < max_shockwave_radius) {
        var d = point_distance(x, y, obj_player.x, obj_player.y);
        if (d >= shockwave_radius - 6 && d <= shockwave_radius + 6) {
            scr_kill_player();
        }
    }

    // Wave dies at max radius
    if (shockwave_radius >= max_shockwave_radius) {
        shockwave_active = false;
        shockwave_timer = shockwave_interval;
    }
	
	
	
}