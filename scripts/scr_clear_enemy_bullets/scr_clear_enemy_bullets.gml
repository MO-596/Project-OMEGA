function scr_clear_enemy_bullets() 
{
with(obj_enemies_bullet) {
	instance_destroy();
	}
}