// INPUTS
var keyLeft  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
var keyUp    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var keyDown  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

var inputDir = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
var inputMag = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

// MOVEMENT
x += lengthdir_x(inputMag * speedWalk, inputDir);
y += lengthdir_y(inputMag * speedWalk, inputDir);
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

// INVINCIBILITY WINDOW
if (riverHit) {
    riverHitTimer--;
    if (riverHitTimer <= 0) riverHit = false;
}

// RIVER HIT
if (place_meeting(x, y, oJourneyRiver) && !riverHit) {
    riverHit      = true;
    riverHitTimer = riverHitDelay;
    lives1--;
    camera_shake(3, 3);
    if (lives1 <= 0) {
        with (oDialogueManager) startDialogue("ring_lost");
    }
}

// WIN TILE
if (place_meeting(x, y, oWinTile)) {
    if      (room == rjourneylevel1) room_goto(rjourneylevel2);
    else if (room == rjourneylevel2) room_goto(rjourneylevel3);
    else if (room == rjourneylevel3) room_goto(rcourtact2);
}

// SPRITE
var _oldsprite = sprite_index;
if (inputMag) {
    direction    = inputDir;
    sprite_index = spriterun;
} else {
    sprite_index = spriteidle;
}
if (_oldsprite != sprite_index) localFrame = 0;
animatesprite();