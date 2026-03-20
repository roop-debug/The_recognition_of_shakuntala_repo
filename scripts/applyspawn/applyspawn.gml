// Call this at the top of oPlayer_firsthalf Create_0 to apply saved spawn
function applyspawn() {
    if (global.spawnX != -1) {
        x = global.spawnX;
        y = global.spawnY;
        global.spawnX = -1;
        global.spawnY = -1;
    }
}