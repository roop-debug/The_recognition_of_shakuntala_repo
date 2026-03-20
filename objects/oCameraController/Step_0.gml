var cam = view_camera[0];

// Update base position (if camera moves normally)
base_x = camera_get_view_x(cam);
base_y = camera_get_view_y(cam);

if (shake_timer > 0)
{
    shake_timer--;

    var offset_x = random_range(-shake_strength, shake_strength);
    var offset_y = random_range(-shake_strength, shake_strength);

    camera_set_view_pos(cam, base_x + offset_x, base_y + offset_y);
}
else
{
    camera_set_view_pos(cam, base_x, base_y);
}