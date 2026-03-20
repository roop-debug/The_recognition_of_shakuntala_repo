x = xstart;
if(!global.gamePaused)
{
    y += speed;
}

if(y > RESOLUTION_H + 32)
{
    instance_destroy();
}