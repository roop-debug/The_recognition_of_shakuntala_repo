x += lengthdir_x(arrowSpeed, direction);

life--;
if (life <= 0) instance_destroy();

if (x > RESOLUTION_W + 32) instance_destroy();