switch (fadeState) {
    case "in":
        alpha += 0.02;
        if (alpha >= 1) {
            alpha     = 1;
            fadeState = "hold";
        }
        break;

    case "hold":
        holdTimer--;
        if (holdTimer <= 0) fadeState = "out";
        break;

    case "out":
        alpha -= 0.02;
        if (alpha <= 0) {
            alpha = 0;
            instance_destroy();
            room_goto(rjourneylevel1);
        }
        break;
}