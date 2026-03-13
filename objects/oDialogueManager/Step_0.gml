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

if (pendingEndCallback == "" && !isActive && activeChainKey == "act2End") {
    activeChainKey = "";
    if (!instance_exists(ofade)) {
        instance_create_layer(0, 0, "Instances", ofade);
    }
}
// Bee approach — wait for player to walk close to shakuntalanpc
if (beeApproachActive && instance_exists(shakuntalanpc) && instance_exists(oPlayer_firsthalf)) {
    var _dist = point_distance(oPlayer_firsthalf.x, oPlayer_firsthalf.y, shakuntalanpc.x, shakuntalanpc.y);
    if (_dist < 32) {
        beeApproachActive = false;
        startDialogue(beeApproachTarget);
    }
}