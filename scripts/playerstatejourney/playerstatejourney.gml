function playerstatejourney() {

    // MOVEMENT
    hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
    vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);
    x += hSpeed;
    y += vSpeed;
    x = clamp(x, 0, room_width);
    y = clamp(y, 0, room_height);

    // INVINCIBILITY TIMER after a hit
    if (riverHit) {
        riverHitTimer--;
        if (riverHitTimer <= 0) {
            riverHit = false;
        }
    }

    // RIVER COLLISION — lose one ring per hit
    if (place_meeting(x, y, oJourneyRiver) && !riverHit) {
        riverHit      = true;
        riverHitTimer = riverHitDelay;
        lives1--;
        camera_shake(3, 3);

        if (lives1 <= 0) {
            state  = playerstatelocked;
            canMove = false;
            with (oDialogueManager) startDialogue("ring_lost");
        }
    }

    // WIN TILE — advance to next room
    if (place_meeting(x, y, oWinTile)) {
        if (room == rjourneylevel1) room_goto(rjourneylevel2);
        else if (room == rjourneylevel2) room_goto(rjourneylevel3);
        else if (room == rjourneylevel3) room_goto(rcourtact2);
    }

    // SPRITE UPDATE
    var _oldsprite = sprite_index;
    if (inputMagnitude != 0) {
        direction    = inputDirection;
        sprite_index = spriterun;
    } else {
        sprite_index = spriteidle;
    }
    if (_oldsprite != sprite_index) localFrame = 0;
    animatesprite();
}