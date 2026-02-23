if(global.gamePaused) exit;

keyLeft  = keyboard_check(vk_left) or keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));

hSpeed = (keyRight - keyLeft) * moveSpeed;
x += hSpeed;

// Clamp inside room
if(x < 32) x = 32;
if(x > RESOLUTION_W - 32) x = RESOLUTION_W - 32;


// Invincibility frames
if(invincibleTimer > 0) invincibleTimer--;


// Collision with wall
if(invincibleTimer <= 0 && place_meeting(x,y,oJourneyObstacle))
{
    lives--;
    invincibleTimer = 60;   // 1 second of immunity
    
    if(lives <= 0)
    {
        gameOver = true;
    }
}


// When both lives are lost
if(gameOver)
{
    newtextbox("Fate cannot be escaped...\nShakuntala's suffering continues.",0);
    instance_destroy();
}