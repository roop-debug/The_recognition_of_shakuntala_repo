if (!done) {
    scrollY -= scrollSpeed;
    // all names have scrolled past center — start showing "The End"
    var _lastNameY = scrollY + (array_length(credits) - 1) * creditSpacing;
    if (_lastNameY < RESOLUTION_H / 2 - 20) {
        done = true;
    }
} else {
    if (theEndAlpha < 1) theEndAlpha += 0.01;
}