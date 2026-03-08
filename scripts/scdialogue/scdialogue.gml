function startDialogue(key) {
    var _chain = global.dialogue[$ key];
    if (is_undefined(_chain)) {
        show_debug_message("DialogueManager: unknown key '" + string(key) + "'");
        exit;
    }
    activeChainKey = key;
    isActive = true;
    var _player = instance_exists(oPlayer_firsthalf) ? oPlayer_firsthalf : oPlayer_secondhalfnpc;
    with (_player) {
        if (state != playerstatelocked) {
            laststate = state;
            state = playerstatelocked;
        }
    }
    var _len = array_length(_chain);
    for (var i = 0; i < _len; i++) {
        var _node = _chain[i];
        var _text = (_node.speaker != "")
            ? _node.speaker + ": " + _node.text
            : _node.text;
        var _bg        = _node[$ "bg"] ?? 0;
        var _responses = _node[$ "responses"] ?? undefined;
        var _audio = _node[$ "audio"] ?? -1;
        if (!is_undefined(_responses)) {
            var _rArr = [];
            for (var r = 0; r < array_length(_responses); r++) {
                _rArr[r] = _responses[r].next + ":" + _responses[r].label;
            }
            newtextbox(_text, _bg, _rArr, true, _audio);
        } else {
            newtextbox(_text, _bg, undefined, false, _audio);
        }
    }
    var _lastNode = _chain[_len - 1];
    pendingEndCallback = _lastNode[$ "onEnd"] ?? "";
}

function branch(key) {
    if (key == "0" || key == "") exit;
    startDialogue(key);
}

function endDialogue() {
    isActive = false;
    activeChainKey = "";
    if (audio_exists(activDialogueSound)) {
        audio_stop_sound(activDialogueSound);
        activDialogueSound = -1;
    }
    var _player = instance_exists(oPlayer_firsthalf) ? oPlayer_firsthalf : oPlayer_secondhalfnpc;
    with (_player) {
        state = laststate;
    }
    if (pendingEndCallback != "") {
        handleEndCallback(pendingEndCallback);
        pendingEndCallback = "";
    }
}

function handleEndCallback(flag) {
    switch (flag) {
        case "hideAscetic":
            if (instance_exists(oascetic)) oascetic.visible = false;
            break;
    }
}