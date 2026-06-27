event_inherited();

var l1B960D2C_0 = false;l1B960D2C_0 = instance_exists(obj_controls);if(l1B960D2C_0){	with(obj_controls) instance_destroy();}

else{	instance_create_layer(room_width / 2, room_height - 100, "Instances", obj_controls);}