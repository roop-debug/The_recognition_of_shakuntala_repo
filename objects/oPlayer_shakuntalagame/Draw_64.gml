var _iconW  = sprite_get_width(sLifeIcon);
var _startX = 8;
var _y      = 8;

for (var i = 0; i < lives1; i++) {
    draw_sprite(sLifeIcon, 0, _startX + i * (_iconW + 4), _y);
}