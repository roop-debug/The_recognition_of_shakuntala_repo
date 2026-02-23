draw_sprite_stretched( sTextBoxBg,background,x1target,y1,x2target,y2 );
draw_set_font(ftext);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_colour(c_black)

var _print= string_copy(message ,1,textProgress);
show_debug_message(_print)
if(responses[0]!=-1 && textProgress>=string_length(message)){
    for (var i=0; i< array_length(responses);i++){
    _print += "\n";
        if(i==responseselected)_print +=" > " ;
            _print += responses [i] ;
        if(i==responseselected)_print += "<";
            
        
    }
    
}
draw_text((x1+x2)/2,y1+8,_print);
draw_set_colour(c_white);
draw_text((x1+x2)/2,y1+7,_print);