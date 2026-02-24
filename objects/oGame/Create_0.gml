//initialise room 

global.gamePaused= false;
global.textspeed=0.75;
//surface_resize(application_surface,RESOLUTION_W,RESOLUTION_H);
display_set_gui_size(RESOLUTION_W,RESOLUTION_H)
room_goto(ROOMSTART);
object_set_visible(oareatrigger,false)
global.textqueue = 0;

