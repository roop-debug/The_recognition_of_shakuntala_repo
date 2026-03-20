// otext - Step Event (MODIFIED)
textProgress += global.textspeed;
x1 = lerp(x1, x1target, lerPprogress);
x2 = lerp(x2, x2target, lerPprogress);

// Play audio once when this textbox becomes active
if (!audioPlayed) {
    audioPlayed = true;
    show_debug_message("nodeAudio value: " + string(nodeAudio));
    if (nodeAudio != -1) {
        if (instance_exists(oDialogueManager)) {
            show_debug_message("attempting to play sound");
            if (audio_exists(oDialogueManager.activDialogueSound)) {
                audio_stop_sound(oDialogueManager.activDialogueSound);
            }
            oDialogueManager.activDialogueSound = audio_play_sound(nodeAudio, 1, false);
            show_debug_message("activDialogueSound after play: " + string(oDialogueManager.activDialogueSound));
        }
    }
}

// Cycle responses
keyUp   = keyboard_check_pressed(vk_up)   or keyboard_check_pressed(ord("W"));
keyDown = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
responseselected += keyDown - keyUp;
var _max = array_length(responses) - 1;
var _min = 0;
if (responseselected > _max) responseselected = _min;
if (responseselected < _min) responseselected = _max;

if (keyboard_check_pressed(vk_space)) {
    var _messagelength = string_length(message);
    if (textProgress >= _messagelength) {
        if (responses[0] != -1) {
            if (!responseBoxReady) {
                responseBoxReady = true;
                exit;
            }
            if (instance_exists(oDialogueManager)) oDialogueManager.isActive = false;
            with (oDialogueManager) branch(other.responsescript[other.responseselected]);
            instance_destroy();
            if (instance_exists(otextqueued)) {
                with (otextqueued) ticket--;
            }
            exit;
        }
        // NEW:
        instance_destroy();
        if (instance_exists(otextqueued)) {
            with (otextqueued) ticket--;
        }
        // always check after destroy — if nothing queued remains, end dialogue
        if (!instance_exists(otext) && !instance_exists(otextqueued)) {
            if (instance_exists(oDialogueManager)) {
                oDialogueManager.isActive = false;
                with (oDialogueManager) endDialogue();
            }
        }
    } else {
        if (textProgress > 2) {
            textProgress = _messagelength;
        }
    }
}