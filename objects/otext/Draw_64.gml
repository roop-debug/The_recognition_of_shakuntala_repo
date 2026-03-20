// Draw main message box
draw_sprite_stretched(sTextBoxBg, background, x1target, y1, x2target, y2);
draw_set_font(ftext);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_colour(c_black);
var _print = string_copy(message, 1, textProgress);
draw_text((x1 + x2) / 2, y1 + 8, _print);
draw_set_colour(c_black);
draw_text((x1 + x2) / 2, y1 + 7, _print);

// Draw response box separately if responses exist and message is complete
if (responses[0] != -1 && responseBoxReady) {
    // Animate response box sliding up
    responseBoxY = lerp(responseBoxY, responseBoxYTarget, 0.2);
    
    // Draw response box
    draw_sprite_stretched(sTextBoxBg, background, 0, responseBoxY, RESOLUTION_W, RESOLUTION_H);
    
    // Draw responses inside it
    var _visibleCount = 3;
    var _total = array_length(responses);
    var _scrollStart = 0;
    if (responseselected >= _visibleCount) {
        _scrollStart = responseselected - _visibleCount + 1;
    }
    var _scrollEnd = min(_scrollStart + _visibleCount, _total);
    var _lineHeight = 20;
    var _startY = responseBoxY + 8;
    
    if (_scrollStart > 0) {
        draw_text(RESOLUTION_W / 2, _startY, "▲");
        _startY += _lineHeight;
    }
    
    for (var i = _scrollStart; i < _scrollEnd; i++) {
        var _label = responses[i];
        if (i == responseselected) _label = " > " + _label + " <";
        draw_text(RESOLUTION_W / 2, _startY, _label);
        _startY += _lineHeight;
    }
    
    if (_scrollEnd < _total) {
        draw_text(RESOLUTION_W / 2, _startY, "▼");
    }
} else {
    // Reset response box position when not showing
    responseBoxY = RESOLUTION_H;
}