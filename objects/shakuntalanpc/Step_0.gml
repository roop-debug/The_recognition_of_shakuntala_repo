sprite_index = spriteidle;
var _p = instance_exists(oPlayer_firsthalf_1) ? oPlayer_firsthalf_1 : oPlayer_firsthalf;
if (instance_exists(_p)) direction = point_direction(x, y, _p.x, _p.y);
animatenpc();