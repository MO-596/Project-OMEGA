if (instance_exists(obj_aegis_boss_body)) {
    x = obj_aegis_boss_body.x;
    y = obj_aegis_boss_body.y;
    image_angle += rotation_speed;
} else {
    instance_destroy(); // body is gone, no reason to exist
}
/*The shield doesn't need its own collision event — the boss body's 
collision code handles the gap-detection math. 
The shield is purely a visual indicator of where the gaps are.*/