/// @function scr_spawn_boss_intro(name)
function scr_spawn_boss_intro(name) {
    var intro = instance_create_layer(0, 0, "Instances", obj_boss_intro);
    intro.boss_name = name;
    return intro;
}