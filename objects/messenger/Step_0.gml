if(array_length(path)> 0){
    scr_move_to_points(path,2)
}

switch (messengerState) {
    case "waiting":
    // wait for bee incident dialogue to fully finish
    if (beeSceneComplete && instance_exists(oDialogueManager) && !oDialogueManager.isActive) {
        messengerState = "walkin";
    }
    break;
    case "walkin":
        var _player = instance_exists(oPlayer_firsthalf) ? oPlayer_firsthalf : oPlayer_secondhalfnpc;
        if (instance_exists(_player)) {
            targetX = _player.x;
            targetY = _player.y;
        }
        var _dist = point_distance(x, y, targetX, targetY);
        if (_dist > 8) {
            var _dir = point_direction(x, y, targetX, targetY);
            x += lengthdir_x(messengerSpeed, _dir);
            y += lengthdir_y(messengerSpeed, _dir);
        } else {
            messengerState = "dialogue";
            with (oDialogueManager) startDialogue("messenger_entry");
        }
        break;
        
    case "dialogue":
        if (instance_exists(oDialogueManager) && !oDialogueManager.isActive) {
            messengerState = "walkout";
            // store exit direction back toward top right
            exitX = room_width + 64;
            exitY = -64;
        }
        break;
        
    case "walkout":
        var _dist = point_distance(x, y, exitX, exitY);
        if (_dist > 8) {
            var _dir = point_direction(x, y, exitX, exitY);
            x += lengthdir_x(messengerSpeed, _dir);
            y += lengthdir_y(messengerSpeed, _dir);
        } else {
            messengerState = "done";
        }
        break;
        
    case "done":
        room_goto(rcourt);
        break;
}