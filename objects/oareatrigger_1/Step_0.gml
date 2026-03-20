if (!triggered && place_meeting(x, y, oPlayer_shakuntala))
{
    triggered = true;

    var _p = instance_place(x, y, oPlayer_shakuntala);

    newtextbox("Collect firewood from forest",0);

    instance_destroy();
}