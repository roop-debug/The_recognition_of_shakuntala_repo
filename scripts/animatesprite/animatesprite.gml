function animatesprite(){
if(state !=playerstatelocked){
var _totalframes = sprite_get_number(sprite_index)/4;
image_index= localFrame + (CARDINALDIRECTION * _totalframes);
localFrame+=sprite_get_speed(sprite_index)/FRAME_RATE; 
    if (localFrame>=_totalframes)
{ animation_end=true; 
    localFrame-=_totalframes; 
    } else animation_end=false; 
}  
}