if (!triggered && place_meeting(x, y, oPlayer_firsthalf))
{
    triggered = true;

    var _p = instance_place(x, y, oPlayer_firsthalf);

    newtextbox("The King is on a hunt\n Press Shift to shoot arrow",0);

    instance_destroy();
}