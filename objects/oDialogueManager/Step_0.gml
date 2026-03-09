// Unlock player timer
if (unlockPlayerTimer > 0) {
    unlockPlayerTimer--;
    if (unlockPlayerTimer == 0) {
        var _p = instance_exists(oPlayer_firsthalf_1) ? oPlayer_firsthalf_1
               : (instance_exists(oPlayer_firsthalf)  ? oPlayer_firsthalf
               :  oPlayer_secondhalfnpc);
        with (_p) { state = laststate; }
    }
}

// Friends walk timer — fires gandharva dialogue after anasuya+priyamvada arrive
if (friendsWalkTimer > 0) {
    friendsWalkTimer--;
    if (friendsWalkTimer == 0) {
        startDialogue("gandharva");
    }
}