/// @function scr_swap_music(new_track)
/// @param {asset} new_track   The sound asset to play (looped)
function scr_swap_music(new_track) {
    // Stop whatever's currently playing
    if (global.manager.current_music != undefined) {
        audio_stop_sound(global.manager.current_music);
    }

    // Defensive: stop any untracked instances of the default music too
    audio_stop_sound(global.manager.music_default);
	//TODO: ISSUE WITH THE BOSS MUSIC ENDING WHEN THE PLAYER DIES AND NOT WHEN IT LEAVES THE ROOM
    // Start the new track
    global.manager.current_music = audio_play_sound(new_track, 10, true);
}

/// @function scr_restore_default_music()
function scr_restore_default_music() {
    scr_swap_music(global.manager.music_default);
}