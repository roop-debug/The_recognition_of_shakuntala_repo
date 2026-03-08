if (!triggered && place_meeting(x, y, oPlayer_firsthalf)) {
    triggered = true;
    
    // Start bee incident dialogue
    with (oDialogueManager) startDialogue("forest_start");
    
    // Put messenger in waiting state until dialogue ends
    if (instance_exists(messenger)) {
        messenger.messengerState = "waiting";
        messenger.beeSceneComplete = true;
    }
    instance_destroy();
}