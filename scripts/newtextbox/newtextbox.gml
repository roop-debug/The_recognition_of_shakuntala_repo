function newtextbox(){
    show_debug_message("newtextbox called - isActive was: " + string(oDialogueManager.isActive));
    if (instance_exists(oDialogueManager)) oDialogueManager.isActive = true;
    
    var _isNpc    = (argument_count > 3) ? argument[3] : false;
    var _message  = argument[0];
    var _bg       = (argument_count > 1) ? argument[1] : 0;
    var _responses = (argument_count > 2) ? argument[2] : undefined;
    var _audio    = (argument_count > 4) ? argument[4] : -1;
    show_debug_message("newtextbox _audio arg: " + string(_audio));
    var _obj;
    if (instance_exists(otext)) {
        _obj = otextqueued;
    } else {
        _obj = otext;
    }
    
    var _inst = instance_create_layer(0, 0, "instances", _obj);
    with (_inst) {
        message    = _message;
        background = _bg;
        nodeAudio  = _audio;
        
        if (instance_exists(other)) origininstance = other.id; else origininstance = noone;
        
        if (!is_undefined(_responses) && _isNpc) {
            for (var i = 0; i < array_length(_responses); i++) {
                responses[i] = _responses[i];
                var _markerposition = string_pos(":", responses[i]);
                responsescript[i] = string_copy(responses[i], 1, _markerposition - 1);
                responses[i] = string_delete(responses[i], 1, _markerposition);
            }
        } else {
            responses    = [-1];
            responsescript = [-1];
        }
    }
    
    with (oPlayer_firsthalf) {
        if (state != playerstatelocked) {
            laststate = state;
            state = playerstatelocked;
        }
    }
}