// Background
draw_set_color(c_black);
draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(smaller);

// Scrolling credits
for (var i = 0; i < array_length(credits); i++) {
    var _y = scrollY + i * creditSpacing;
    // only draw if on screen
    if (_y > -10 && _y < RESOLUTION_H + 10) {
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_text(RESOLUTION_W / 2, _y, credits[i]);
    }
}

// "The End" fades in after credits finish
if (done) {
    draw_set_alpha(theEndAlpha);
    draw_set_font(ftext);
    draw_set_color(c_white);
    draw_text(RESOLUTION_W / 2, RESOLUTION_H / 2, "The End");
}

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);