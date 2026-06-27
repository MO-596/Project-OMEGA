if (instance_exists(obj_ending)){ 
	exit;
}
// Forward Movement buttons
var l_forward_button = keyboard_check(ord("W"));
if (l_forward_button)
{
	motion_add(image_angle, 0.1);
}

var forward_arrow = keyboard_check(vk_up);
if (forward_arrow)
{
	motion_add(image_angle, 0.1);
}

// Backward Movement buttons
var back_arrow = keyboard_check(vk_down);
if (back_arrow)
{
	motion_add(image_angle, -0.1);
}

var l_back_arrow = keyboard_check(ord("S"));
if (l_back_arrow)
{
	motion_add(image_angle, -0.1);
}

// Angle Movement Left button
var l_left_arrow = keyboard_check(ord("A"));
if (l_left_arrow)
{
	image_angle += 4;
}

var left_arrow = keyboard_check(vk_left);
if (left_arrow)
{
	image_angle += 4;
}

// Angle Movement Right button
var right_arrow = keyboard_check(vk_right);
if (right_arrow)
{
	image_angle += -4;
}

var l_right_arrow = keyboard_check(ord("D"));
if (l_right_arrow)
{
	image_angle += -4;
}

//wraps the player in the room
move_wrap(1, 1, 0);

var fire_bullet = mouse_check_button_pressed(mb_left);
if (fire_bullet)
{
	instance_create_layer(x + 0, y + 0, "Instances", obj_bullet);

	audio_play_sound(snd_shoot, 0, 0, 2.0, undefined, random_range(0.8,1.2));

	if(spread_active)
	{
		bullet = instance_create_layer(x + 0, y + 0, "Instances", obj_bullet);
	
		bullet.direction += 10;
	
		var bullet = instance_create_layer(x + 0, y + 0, "Instances", obj_bullet);
	
		bullet.direction += -10;
	}
	
}