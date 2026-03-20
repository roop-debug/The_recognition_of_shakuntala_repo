// INPUTS
var keyLeft  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
var keyUp    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var keyDown  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

var inputDir = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
var inputMag = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

// MOVEMENT WITH COLLISION
hSpeed = lengthdir_x(inputMag * speedWalk, inputDir);
vSpeed = lengthdir_y(inputMag * speedWalk, inputDir);

// Horizontal
if (tilemap_get_at_pixel(collisionmap, x + hSpeed, y) != 0) {
    hSpeed = 0;
}
x += hSpeed;

// Vertical
if (tilemap_get_at_pixel(collisionmap, x, y + vSpeed) != 0) {
    vSpeed = 0;
}
y += vSpeed;

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

// INVINCIBILITY WINDOW
if (riverHit) {
    riverHitTimer--;
    if (riverHitTimer <= 0) riverHit = false;
}

// RIVER HIT
// RIVER HIT
if (place_meeting(x, y, oJourneyRiver) && !riverHit) {
    riverHit      = true;
    riverHitTimer = riverHitDelay;
    lives1--;
    show_debug_message("RIVER HIT — lives1 now: " + string(lives1));
    camera_shake(3, 3);
    if (lives1 <= 0) {
        show_debug_message("CALLING ring_lost — oDialogueManager exists: " + string(instance_exists(oDialogueManager)));
        with (oDialogueManager) {
            show_debug_message("inside with — calling startDialogue");
            startDialogue("ring_lost");
        }
    }
}

// WIN TILE
if (place_meeting(x, y, oWinTile)) {
    show_debug_message("this is room",room)
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
// SPRITE
var _oldsprite = sprite_index;
if (inputMag) {
    direction    = inputDir;
    sprite_index = spriterun;
} else {
    sprite_index = spriteidle;
}
if (_oldsprite != sprite_index) localFrame = 0;

// ANIMATE — inline, no state check
var _totalframes = sprite_get_number(sprite_index) / 4;
image_index = localFrame + (CARDINALDIRECTION * _totalframes);
localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
if (localFrame >= _totalframes) localFrame -= _totalframes;