survival_time += delta_time / 1000000; // delta_time is microseconds → seconds

if (powerup_time > 0) {
    powerup_time -= 1;
}