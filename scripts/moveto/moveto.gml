

function scr_move_to_points(_points, _speed)
{
    // Initialize point index once
    if (!variable_instance_exists(id, "point_index"))
    {
        point_index = 0;
    }

    // Stop if finished
    if (point_index >= array_length(_points))
    {
        // Switch to idle when done
        if (sprite_index != npc)
        {
            sprite_index =npc;
            localFrame = 0;
        }

        animatesprite();
        return;
    }

    var target_x = _points[point_index][0];
    var target_y = _points[point_index][1];

    var dir  = point_direction(x, y, target_x, target_y);
    var dist = point_distance(x, y, target_x, target_y);

    var move_x = 0;
    var move_y = 0;

    if (dist > _speed)
    {
        move_x = lengthdir_x(_speed, dir);
        move_y = lengthdir_y(_speed, dir);

        x += move_x;
        y += move_y;
    }
    else
    {
        x = target_x;
        y = target_y;
        point_index += 1;
    }

    // ---------------------------------
    // DIRECTION LOGIC
    // ---------------------------------

    if (abs(move_x) > abs(move_y))
    {
        if (move_x > 0)      direction=90; // right
        else if (move_x < 0) direction=270; // left
    }
    else if (abs(move_y) > 0)
    {
        if (move_y > 0)      direction =180 ; // down
        else if (move_y < 0) direction = 0; // up
    }

    // ---------------------------------
    // SPRITE SWITCHING
    // ---------------------------------

    var moving = (move_x != 0 || move_y != 0);

    if (moving)
    {
        if (sprite_index != npcMoving)
        {
            sprite_index = npcMoving;
            localFrame = 0;
        }
    }
    else
    {
        if (sprite_index != npc)
        {
            sprite_index = npc;
            localFrame = 0;
        }
    }

    // ---------------------------------
    // RUN YOUR ANIMATION SYSTEM
    // ---------------------------------

    animatesprite();
}
