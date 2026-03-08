if (array_length(path) > 0) {
    scr_move_to_points(path, 2);
}

switch (vidushakaState) {

    case "idle":
        // rcourt room start sets state to "walkin"
        break;

    case "walkin":
        var _player = instance_exists(oPlayer_secondhalfnpc) ? oPlayer_secondhalfnpc : noone;
        if (instance_exists(_player)) {
            targetX = _player.x + 18; // conversation gap, adjust to taste
            targetY = _player.y;
        }
        var _dist = point_distance(x, y, targetX, targetY);
        if (_dist > 16) {
            var _dir = point_direction(x, y, targetX, targetY);
            x += lengthdir_x(vidushakaSpeed, _dir);
            y += lengthdir_y(vidushakaSpeed, _dir);
            direction    = _dir;
            sprite_index = spriterun;
            animatenpc();
        } else {
            sprite_index = spriteidle;
            animatenpc();
            vidushakaState = "dialogue";
            with (oDialogueManager) startDialogue("court1");
        }
        break;

    case "dialogue":
        // dialogue manager handles everything
        // endCallback on res1 will fire "fadeToForest"
        break;

    case "done":
        // stays on screen, nothing to do
        break;
}