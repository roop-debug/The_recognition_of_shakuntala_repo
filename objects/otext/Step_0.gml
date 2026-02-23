lerPprogress+= (1-lerPprogress)/50;
textProgress += global.textspeed;
lerp(x1,x1target,lerPprogress);
lerp(x2,x2target,lerPprogress);
//cycle responses
 keyUp=keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
 keyDown=keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
responseselected+=keyDown-keyUp;
var _max= array_length(responses)-1;
var _min =0;
if( responseselected >_max) responseselected = _min;
if(responseselected<_min) responseselected = _max;    


if(keyboard_check_pressed(vk_space)){
    var _messagelength = string_length(message)
    if(textProgress>= _messagelength){
        if(responses[0]!=-1){
            with(origininstance)dialogueresponses(other.responsescript[other.responseselected]);
        }
        instance_destroy();
        if(instance_exists(otextqueued)){
            with(otextqueued) ticket--;
                
        }
        else{
            with(oPlayer_firsthalf) state = laststate;
        }
    }
    else{
        if(textProgress>2){
            textProgress=_messagelength;
        }
    }
    
}