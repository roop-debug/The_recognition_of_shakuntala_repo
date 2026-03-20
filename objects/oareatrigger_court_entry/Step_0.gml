if (!triggered && place_meeting(x, y, oPlayer_shakuntala)) {
    triggered = true;
    with (oDialogueManager) startDialogue("court_entry");
    instance_destroy();
}