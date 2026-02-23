x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Reduce lifetime
life--;
if (life <= 0)
{
    instance_destroy();
}

// Destroy if outside room
if (x < -32 || x > RESOLUTION_W + 32 || y < -32 || y > RESOLUTION_H + 32)
{
    instance_destroy();
}