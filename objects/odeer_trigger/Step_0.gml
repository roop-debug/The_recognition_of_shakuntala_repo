if (place_meeting(x, y, oPlayer_firsthalf))
{
    instance_create_layer(x+20, y-80, "instances", odeer);
    show_debug_message("SPAWNED")
    instance_destroy(); // prevents repeat spawning
}