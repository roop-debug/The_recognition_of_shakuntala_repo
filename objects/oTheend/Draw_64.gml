draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false);
draw_set_alpha(alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(-1); // replace -1 with your font asset if you have one
draw_set_color(c_white);
draw_text(RESOLUTION_W / 2, RESOLUTION_H / 2, "End of Act II");
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);