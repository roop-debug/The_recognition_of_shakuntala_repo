if (!triggered && place_meeting(x, y, oPlayer_firsthalf))
{
    triggered = true;

    var _p = instance_place(x, y, oPlayer_firsthalf);

    newtextbox("Sign Post: Hermitage grounds ahead\n ----->",0);

    instance_destroy();
}