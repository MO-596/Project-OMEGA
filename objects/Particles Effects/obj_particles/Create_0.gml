
ps = part_system_create();
part_system_depth(ps, -1000); // draw on top of everything

// --- Rock explosion particle ---
pt_rock = part_type_create();

part_type_shape(pt_rock, pt_shape_pixel); // tiny square, very retro
part_type_size(pt_rock, 1, 3, 0, 0);
part_type_speed(pt_rock, 2, 6, 0, 0);
part_type_direction(pt_rock, 0, 360, 0, 0); // all directions
part_type_orientation(pt_rock, 0, 360, 0, 0, 1);
part_type_colour2(pt_rock, c_white, c_gray); // fades white→gray
part_type_alpha2(pt_rock, 1, 0); // fades out
part_type_life(pt_rock, 15, 30); // lives 0.25-0.5 sec
