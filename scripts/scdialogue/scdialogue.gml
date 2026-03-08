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
        case "fadeToForest":
            with (vidushakha) { vidushakaState = "done"; }
            forestVisitCount++;
            if (instance_exists(oPlayer_secondhalfnpc)) {
                global.spawnX = oPlayer_secondhalfnpc.x;
                global.spawnY = oPlayer_secondhalfnpc.y;
            }
            room_goto(rjungleact1);
            break;

        // ── Scene 8: Anasuya + Priyamvada walk in after mar ──
        case "walkInFriends":
            // Set targets near Shakuntala
            var _sx = instance_exists(shakuntalanpc) ? shakuntalanpc.x : room_width / 2;
            var _sy = instance_exists(shakuntalanpc) ? shakuntalanpc.y : room_height / 2;
            with (anasuya)    { targetX = _sx - 20; targetY = _sy + 8;  npcState = "walkin"; }
            with (priyamvada) { targetX = _sx + 20; targetY = _sy + 8;  npcState = "walkin"; }
            // After friends arrive, trigger gandharva marriage dialogue
            // Short delay then fire — handled by a flag
            oDialogueManager.friendsWalkTimer = room_speed * 2;
            break;

        // ── Scene 9: Departure ────────────────────────────────
        case "triggerDeparture":
            with (oDialogueManager) startDialogue("departure");
            break;

        case "kingDeparts":
            // Lock player, hide King, trigger Durvasa entrance
            with (oPlayer_firsthalf) {
                state        = playerstatelocked;
                visible      = false;
            }
            with (durvasanpc) { npcState = "walkin"; }
            break;

        // ── Scene 10: End of Act 1 ───────────────────────────
        case "act1End":
            // Lock everyone — act is over
            with (oPlayer_firsthalf) { state = playerstatelocked; }
            with (durvasanpc)        { npcState = "done"; }
            // Transition to Act 2 when ready:
            // room_goto(rjungleact2);
            break;
    }
}