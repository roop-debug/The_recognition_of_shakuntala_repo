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
        }
        animatenpc();
        break;

    case "done":
        sprite_index = spriteidle;
        animatenpc();
        break;
}