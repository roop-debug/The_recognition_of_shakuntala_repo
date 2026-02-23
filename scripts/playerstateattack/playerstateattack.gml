function playerstateattack()
{
    // Stop movement
    hSpeed = 0;
    vSpeed = 0;

    // Set attack sprite
    sprite_index = spriteattack;
    image_speed = 0.2;

    // Fire arrow at specific frame
    if (image_index >= image_number - 1)
    {
        // Spawn arrow
        var _arrow = instance_create_layer(x + 16, y, "instances", oarrow);
        _arrow.direction = 0; // facing right

        // Return to free state
        state = playerstatefree;
        image_index = 0;
        sprite_index = spriteidle;
    }
}
