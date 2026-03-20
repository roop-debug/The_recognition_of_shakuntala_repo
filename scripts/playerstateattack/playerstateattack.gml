function playerstateattack() {
    hSpeed = 0;
    vSpeed = 0;

    sprite_index = spriteattack;
    image_speed  = 1;

    localFrame++;
    var _totalFrames = sprite_get_number(spriteattack);
    var _frame       = floor(localFrame / (FRAME_RATE / (_totalFrames * image_speed)));
    image_index      = min(_frame, _totalFrames - 1);

    if (image_index >= _totalFrames - 1) {
        // fire arrow to the right
        var _arrow       = instance_create_layer(x + 16, y, "Instances_1", oarrow);
        _arrow.direction = 0;

        // reset
        localFrame   = 0;
        image_index  = 0;
        image_speed  = 0;
        sprite_index = spriteidle;
        state        = playerstatefree;
    }
}