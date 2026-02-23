if (!triggered && place_meeting(x, y, oPlayer_firsthalf))
{
    triggered = true;

    var _p = instance_place(x, y, oPlayer_firsthalf);

    // Change sprites
    _p.spriterun  = dushyantaarmedmove;
    _p.spriteidle = dushyantaarmedplayer;

    // Optional: force immediate visual update
    _p.sprite_index = _p.spriteidle;
    _p.image_index = 0;

    newtextbox("Cannot go in a chariot further\nYou must carry forward on foot",0);

    instance_destroy();
}