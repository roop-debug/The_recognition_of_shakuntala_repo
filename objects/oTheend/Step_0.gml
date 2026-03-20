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

    
}