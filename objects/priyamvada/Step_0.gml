switch (npcState) {

    case "idle":
        sprite_index = spriteidle;
        animatenpc();
        break;

    case "walkin":
        var _dist = point_distance(x, y, targetX, targetY);
        if (_dist > 8) {
            var _dir = point_direction(x, y, targetX, targetY);
            x += lengthdir_x(npcSpeed, _dir);
            y += lengthdir_y(npcSpeed, _dir);
            direction    = _dir;
            sprite_index = spriterun;
        } else {
            x            = targetX;
            y            = targetY;
            npcState     = "done";
            sprite_index = spriteidle;
            var _p = instance_exists(oPlayer_firsthalf_1) ? oPlayer_firsthalf_1 : oPlayer_firsthalf;
            if (instance_exists(_p)) direction = point_direction(x, y, _p.x, _p.y);
        }
        animatenpc();
        break;

    case "done":
        sprite_index = spriteidle;
        animatenpc();
        break;
}