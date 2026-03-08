function animatenpc(){
 // animatenpc()
// Call this on any NPC that has: localFrame, direction, spriteidle, spriterun
// Sprites must be 16-frame sheets: 4 directions × 4 frames each

    var _totalframes = sprite_get_number(sprite_index) / 4;
    image_index = localFrame + (CARDINALDIRECTION * _totalframes);
    localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
    if (localFrame >= _totalframes) {
        localFrame -= _totalframes;
    }

}