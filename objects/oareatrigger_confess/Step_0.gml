if (!triggered && place_meeting(x, y, oPlayer_firsthalf_1)) {
    triggered = true;
    with (oDialogueManager) startDialogue("confess");
    instance_destroy();
}