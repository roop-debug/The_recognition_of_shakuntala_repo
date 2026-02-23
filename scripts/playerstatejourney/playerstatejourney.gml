
function playerstatejourney()
{
    // MOVEMENT (only if not riverHit)
   
    
        hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
    vSpeed= lengthdir_y(inputMagnitude*speedWalk,inputDirection);
        x += hSpeed;
        y += vSpeed;
        x = clamp(x, 0, room_width);
        y = clamp(y, 0, room_height);
   
    


    // OBSTACLE COLLISION
    if(place_meeting(x,y,oJourneyObstacle) && !riverHit)
    {
        lives1-= 1;
        camera_shake(3,3)
    }


    // RIVER COLLISION
    if(place_meeting(x,y,oJourneyRiver) && !riverHit)
    {
        riverHit = true;
        lives1 = 0;
        ringLost = true;
        riverRealizationTimer = 0;

        spriterun = shakuntalamoving;
        spriteidle = shakuntalaplayer;
    }


    // REALIZATION TIMER
    if(riverHit)
    {
        riverRealizationTimer++;

        if(riverRealizationTimer >= riverRealizationDelay)
        {
           state=playerstatelocked;

            instance_create_layer(
                RESOLUTION_W/2,
                RESOLUTION_H/2,
                "Instances",
                oDialogueController
            );
        }
    }


    // -------------------------
    // UPDATE SPRITE (EXACT STYLE)
    // -------------------------

    var _oldsprite = sprite_index;

    if(inputMagnitude != 0 && !riverHit)
    {
        direction = 90;
        sprite_index = spriterun;
    }
    else
    {
        sprite_index = spriteidle;
    }

    if(_oldsprite != sprite_index)
    {
        localFrame = 0;
    }

    animatesprite();
}
