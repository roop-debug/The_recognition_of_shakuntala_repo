switch (npcState) {

    case "idle":
        sprite_index = spriteidle;
        animatenpc();
        break;

    case "walkin":
        // Walk toward Shakuntala
        var _target = instance_exists(shakuntalanpc) ? shakuntalanpc : noone;
        if (instance_exists(_target)) {
            targetX = _target.x + 32;
            targetY = _target.y;
        }
        var _dist = point_distance(x, y, targetX, targetY);
        if (_dist > 16) {
            var _dir = point_direction(x, y, targetX, targetY);
            x += lengthdir_x(npcSpeed, _dir);
            y += lengthdir_y(npcSpeed, _dir);
            direction    = _dir;
            sprite_index = spriterun;
            animatenpc();
        } else {
            npcState     = "dialogue";
            sprite_index = spriteidle;
            animatenpc();
            with (oDialogueManager) {
                startDialogue("durvasa_curse");
            }
        }
        break;

    case "dialogue":
        sprite_index = spriteidle;
        animatenpc();
        break;

    case "done":
        // Walk off screen left
        x -= npcSpeed;
        direction    = 180;
        sprite_index = spriterun;
        animatenpc();
        if (x < -64) instance_destroy();
        break;
}