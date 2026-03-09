// Background
draw_set_color(c_black);
draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false);

draw_set_alpha(alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Title
draw_set_font(ftext);
draw_set_color(c_white);
draw_text(RESOLUTION_W / 2, RESOLUTION_H / 2 - 32, "The Recognition of Shakuntala");

// Icon
var _iconW = sprite_get_width(sLifeIcon);
draw_sprite(sLifeIcon, 0, RESOLUTION_W / 2 - _iconW / 2, RESOLUTION_H / 2 - 8);

// Prompt
draw_set_font(smaller);
draw_set_color(c_ltgray);
draw_text(RESOLUTION_W / 2, RESOLUTION_H / 2 + 24, "Press Enter to Start");

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);