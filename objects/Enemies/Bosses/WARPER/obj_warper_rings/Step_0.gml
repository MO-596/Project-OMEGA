ring_angle += ring_rotation_speed;
if (instance_exists(obj_warper_3)) {
    x = obj_warper_3.x;
    y = obj_warper_3.y;
    image_angle += ring_rotation_speed;
} else {
    instance_destroy(); // body is gone, no reason to exist
}