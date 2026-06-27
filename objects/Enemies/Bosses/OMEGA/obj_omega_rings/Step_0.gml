

if (instance_exists(obj_omega_core)) {
    x = obj_omega_core.x;
    y = obj_omega_core.y;
    image_angle += rotation_speed;
} else {
    instance_destroy(); // body is gone, no reason to exist
}

// Fade out smoothly during the core's death animation
if (obj_omega_core.state == 2) {
	instance_destroy();
}

/*The shield doesn't need its own collision event — the boss body's 
collision code handles the gap-detection math. 
The shield is purely a visual indicator of where the gaps are.*/