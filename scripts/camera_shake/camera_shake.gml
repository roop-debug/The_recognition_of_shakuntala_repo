function camera_shake(_duration, _strength){
    var controller = instance_find(oCameraController, 0);

if (controller != noone)
{
    controller.shake_timer = _duration;
    controller.shake_strength = _strength;
}
}