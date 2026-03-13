if (!triggered && place_meeting(x, y, oPlayer_shakuntalagame))
{
    triggered = true;

    var _p = instance_place(x, y, oPlayer_shakuntalagame);

    newtextbox("Let the flowers guide you\n!!Avoid The Water!!",0);

    instance_destroy();
}