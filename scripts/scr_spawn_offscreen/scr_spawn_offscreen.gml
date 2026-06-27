/// @function scr_spawn_offscreen(obj)
/// @param {asset} obj  Object to spawn just outside the room, drifting inward
function scr_spawn_offscreen(obj) 
{
	var margin = 80; // how far outside the room to spawn
    var side = irandom(3); // 0=top, 1=right, 2=bottom, 3=left
    var sx, sy;
    
    switch (side) {
        case 0: // top
            sx = irandom_range(0, room_width);
            sy = -margin;
        break;
        case 1: // right
            sx = room_width + margin;
            sy = irandom_range(0, room_height);
        break;
        case 2: // bottom
            sx = irandom_range(0, room_width);
            sy = room_height + margin;
        break;
        case 3: // left
            sx = -margin;
            sy = irandom_range(0, room_height);
        break;
    }
    
    var inst = instance_create_layer(sx, sy, "Instances", obj);
    
    // Aim it toward a random point in the central play area so it drifts on-screen
    var target_x = irandom_range(room_width * 0.3, room_width * 0.7);
    var target_y = irandom_range(room_height * 0.3, room_height * 0.7);
    inst.direction = point_direction(sx, sy, target_x, target_y);
    inst.image_angle = inst.direction;
    
	inst.spawning = true; // tells the object not to wrap yet
	
    return inst;
}