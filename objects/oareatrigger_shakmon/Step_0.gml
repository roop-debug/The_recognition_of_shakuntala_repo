if (!triggered && place_meeting(x, y, oPlayer_firsthalf_1)) {
    triggered = true;
    with (oDialogueManager) startDialogue("shakmon_entry");
    instance_destroy();
}