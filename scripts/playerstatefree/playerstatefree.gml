function playerstatefree(){
//movement
 hSpeed= lengthdir_x(inputMagnitude*speedWalk,inputDirection);
 vSpeed= lengthdir_y(inputMagnitude*speedWalk,inputDirection);
playercollision();
x+=hSpeed;
y+=vSpeed;
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

//update sprite
var _oldsprite=sprite_index;
if(inputMagnitude != 0 )
{
    direction=inputDirection;
    sprite_index=spriterun;
    
}
else{
    sprite_index=spriteidle;
    
}
if(_oldsprite!= sprite_index){
    localFrame=0;
}
//animate sprite
     animatesprite();
    if(keyInteract){
    var _activatex = lengthdir_x(24, direction);
    var _activatey = lengthdir_y(24, direction);
    
    activate = instance_place(x, y, p_entity);
    
    if(activate == -4 || activate.entityActivatescript== -1){
        state=playerstatefree;
        
    }
    
    else{
        script_execute_ext(activate.entityActivatescript, activate.entityActivateargs);
         //make npc face player
    if(activate.entityNpc){
            with(activate){
                direction = point_direction(x,y,other.x,other.y);
                image_index = CARDINALDIRECTION;
            }
    }
    }
    
   
}

if(keyAttack && oPlayer_firsthalf.attackCooldown== 0){
    state=playerstateattack ;
    attackcooldown=20;
}
}



