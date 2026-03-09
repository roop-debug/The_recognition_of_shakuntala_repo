if (!triggered && place_meeting(x, y, oPlayer_shakuntala)) {
    triggered = true;
    with (oDialogueManager) startDialogue("durvasa_curse");
    instance_destroy();
}