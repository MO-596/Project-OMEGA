if (image_alpha < 1) {
    image_alpha += 0.02; // fades in over ~0.8 sec
}

bob_timer += bob_speed;
y = bob_origin_y + sin(bob_timer) * bob_amount;