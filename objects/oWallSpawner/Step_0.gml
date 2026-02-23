/// oWallSpawner — Step Event

// Countdown for room duration
roomTimer -= 1;
var _riverspawning= false
// When timer ends → go to next room
if (roomTimer <= 0)
{
    room_goto(rNextRoom); // change to your next room name
}


// =============================
// RIVER ACCELERATION LOGIC
// =============================

var player = instance_find(oPlayer_shakuntala, 0);

if (player != noone)
{
    // If player has lost one life and river hasn't spawned yet,
    // force river to spawn in 6 seconds max
    if (!riverSpawned && !riverWarning)
    {
        if (player.lives1 == 1)
        {
            riverSpawnTimer = 9 * room_speed; // 6 seconds
        }
    }
}


// =============================
// RIVER TIMER
// =============================

if (!riverSpawned)
{
    riverSpawnTimer -= 1;

    // Show warning slightly before spawn
    if (riverSpawnTimer <= 2 * room_speed && !riverWarning)
    {
        riverWarning = true;
        show_debug_message("River incoming...");
        // Optional: spawn warning effect here
    }

    // Spawn river
    if (riverSpawnTimer <= 0)
{
    var block_width = sprite_get_width(Sprite_0001);
    var blocks = ceil(room_width / block_width);

    for (var i = 0; i < blocks; i++)
    {
        instance_create_layer(
            i * block_width,
            -50,
            "Instances",
            oJourneyRiver
        );
    } 
     _riverspawning = true
    riverSpawned = true;
}
}


// =============================
// OBSTACLE SPAWNING
// =============================

obstacleSpawnTimer -= 1;
if(_riverspawning=false){
if (obstacleSpawnTimer <= 0)
{
    var block_width  = sprite_get_width(obstacle);
    var block_height = sprite_get_height(obstacle);

    var cols = ceil(room_width / block_width);
    var rows = 4; // thickness

    // Base hole column
    var base_hole = irandom(cols - 1);

    for (var r = 0; r < rows; r++)
    {
        // Slight horizontal shift per row
        var hole_index = clamp(base_hole + irandom_range(-1, 1), 0, cols - 1);

        for (var c = 0; c < cols; c++)
        {
            if (c != hole_index)
            {
                instance_create_layer(
                    c * block_width,
                    -50 - (r * block_height),
                    "Instances_1",
                    oJourneyObstacle
                );
            }
        }
    }

    obstacleSpawnTimer = obstacleSpawnDelay;
}
}