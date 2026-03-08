x1 = RESOLUTION_W/2;

y1 = RESOLUTION_H-70;
x2 = RESOLUTION_W/2;
y2 = RESOLUTION_H;

responseBoxY = RESOLUTION_H;
responseBoxYTarget = RESOLUTION_H - 80;

x1target =0;
x2target= RESOLUTION_W;
lerPprogress= 0;

textProgress = 0;

background = 1

responseselected =0;

// Add to otext Create event
if (!variable_instance_exists(id, "responses")) responses = [-1];
if (!variable_instance_exists(id, "responsescript")) responsescript = [-1];
if (!variable_instance_exists(id, "responseselected")) responseselected = 0;
if (!variable_instance_exists(id, "message")) message = "";
if (!variable_instance_exists(id, "audioPlayed")) audioPlayed = false;
responseBoxReady = false;