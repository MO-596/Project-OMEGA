
audio_play_sound(snd_extra_life_pickup, 0, 0, 1.0, undefined, 1.0);

with(global.manager){
	Lives = min(Lives + 1, 5); // cap at 5 lives
}

with(other){
	instance_destroy();
}