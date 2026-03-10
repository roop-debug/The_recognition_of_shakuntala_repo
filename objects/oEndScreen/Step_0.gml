if (!done) {
    if (theEndAlpha < 1) {
        theEndAlpha += 0.01;
    } else {
        done = true;
        scrollY = RESOLUTION_H / 2 + 10;
    }
} else {
    scrollY -= scrollSpeed;
}