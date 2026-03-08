// Unlock player timer — used for Scene 3 follow sequence
if (unlockPlayerTimer > 0) {
    unlockPlayerTimer--;
    if (unlockPlayerTimer == 0) {
        var _p = instance_exists(oPlayer_firsthalf) ? oPlayer_firsthalf : oPlayer_secondhalfnpc;
        with (_p) {
            state = laststate;
        }
    }
}