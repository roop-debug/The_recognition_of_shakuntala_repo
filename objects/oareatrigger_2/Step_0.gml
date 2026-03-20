if (!triggered && place_meeting(x, y, oPlayer_firsthalf_1))
{
    triggered = true;

    var _p = instance_place(x, y, oPlayer_firsthalf_1);

    newtextbox("Find and go to Shakuntala \n(Hint: Follow the flowers)",0);

    instance_destroy();
}