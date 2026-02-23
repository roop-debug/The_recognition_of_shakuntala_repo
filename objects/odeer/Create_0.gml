image_speed = 1;
image_xscale = 0.5;
image_yscale = 0.5;
move_spd = 1.2;
state = 0;          // 0=moving, 1=waiting

points = [
    [x, y - 60],         // start
    [x + 60, y - 60],
    [x + 160, y - 80],
    [x + 260, y - 100],
    [x + 360, y - 120],
    [x+ 1000, y - 300]
];

point_index = 1;    // next target
wait_radius = 80;   // distance to detect player
arrived = false;