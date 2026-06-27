if (obj_player.ghost_active) {
    // ghost mode — enemy dies, player lives
    scr_destroy_target(100, snd_rockdestroy, false);
    exit;
}
// Kill player and self
scr_kill_player();