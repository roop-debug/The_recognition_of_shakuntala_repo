//initialise room 

global.gamePaused= false;
global.textspeed=0.75;
//surface_resize(application_surface,RESOLUTION_W,RESOLUTION_H);
display_set_gui_size(RESOLUTION_W,RESOLUTION_H)
room_goto(ROOMSTART);
object_set_visible(oareatrigger,false)
global.textqueue = 0;
// Spawn point globals — set before room_goto to control where player appears
global.spawnX = -1; // -1 = use room editor position
global.spawnY = -1;
