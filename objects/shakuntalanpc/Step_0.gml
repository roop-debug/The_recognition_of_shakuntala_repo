switch (npcState) {

    case "idle":
        sprite_index = spriteidle;
        animatenpc();
        break;

    case "walking":
        // Walk leftward
        x -= npcSpeed;
        direction    = 180; // facing left
        sprite_index = spriterun;
        animatenpc();

        // Stop after walking far enough (adjust walkDistance in Create)
        if (x <= walkTargetX) {
            x        = walkTargetX;
            npcState = "stopped";
            sprite_index = spriteidle;
            animatenpc();
            // Trigger shakmon dialogue once she stops
            with (oDialogueManager) {
                startDialogue("shakmon");
            }
        }
        break;

    case "stopped":
        sprite_index = spriteidle;
        animatenpc();
        break;
}