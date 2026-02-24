function newtextbox(){
    ///@arg message
    /// @arg background
    /// @arg responses
    /// @arg isNpc
     
     var _obj=otext;
     var _isNpc=argument[3];
     state=playerstatelocked;
       if(instance_exists(otext)){
        _obj=otextqueued;
           
         }
       else _obj = otext;
     with(instance_create_layer(0,0,"instances",_obj)){
        message=argument[0]
        
   
    if (instance_exists(other))origininstance = other.id; else origininstance=noone;
    if(argument_count>1) background =argument [1] else background =0; 
    if(argument_count>2 && _isNpc){
        var _array= argument[2];
        for(var i =0; i<array_length(_array);i++){
            responses[i]=_array[i];
            var _markerposition = string_pos(":",responses[i]);
            responsescript[i]=string_copy(responses[i],1,_markerposition-1);
            responses[i]=string_delete(responses[i],1,_markerposition); 
            breakpoint=10;   
    
            }
        }
    else{
                responses= [-1];
                responsescript= [-1];
                 
    }
   }

    with(oPlayer_firsthalf){
        if(state != playerstatelocked){
        laststate = state;
        state= playerstatelocked;
        
        }
    }
}       