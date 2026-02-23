if (global.gamePaused) exit;

switch (state)
{
    case 0: // moving
        var tx = points[point_index][0];
        var ty = points[point_index][1];
        
        var dist = point_distance(x, y, tx, ty);
        
        if (dist > move_spd)
        {
            var dir = point_direction(x, y, tx, ty);
        
            x += lengthdir_x(move_spd, dir);
            y += lengthdir_y(move_spd, dir);
        
            arrived = false; // still travelling
        }
        else if (!arrived)   // FAIL SAFE HERE
        {
            x = tx;
            y = ty;
        
            arrived = true;   // latch triggers ONCE
            state = 1;        // enter waiting
        }
    break;

    case 1: // waiting for player
        if (instance_exists(oPlayer_firsthalf))
                   {
           if (instance_exists(oPlayer_firsthalf))
           {
               var d = point_distance(x, y,
                                      oPlayer_firsthalf.x,
                                      oPlayer_firsthalf.y);
           
               if (d < wait_radius)
               {
                   point_index++;
                   arrived = false;   // reset latch
           
                   if (point_index >= array_length(points))
                       instance_destroy();
                   else
                       state = 0;
               }
           }
        }
    break;
}