collisionmap  = layer_tilemap_get_id(layer_get_id("col"));
state         = playerstatejourney;
laststate     = playerstatejourney;
image_speed   = 0;
hSpeed        = 0;
vSpeed        = 0;
speedWalk     = 1.0;
spriterun     = shakuntalamoving;
spriteidle    = shakuntalaplayer;
localFrame    = 0;
canMove       = true;

lives1        = 2;
riverHit      = false;
riverHitTimer = 0;
riverHitDelay = 90;