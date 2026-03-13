if (!triggered && place_meeting(x, y, oPlayer_shakuntalagame))
{
    triggered = true;

    var _p = instance_place(x, y, oPlayer_shakuntalagame);

    newtextbox("The Palace is on the other side of the river",0);

    instance_destroy();
}