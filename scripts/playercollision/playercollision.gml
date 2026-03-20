function playercollision(){
    var _collision = false;
    //horizontal tiles
    var _x= floor(x);
    var _y= floor (y);
    if(tilemap_get_at_pixel(collisionmap,_x+hSpeed,_y)){
        x-=x mod TILESIZE;
        if(sign(hSpeed)==1) x+= TILESIZE -1;
        hSpeed=0;
        _collision=true;    
    }
    
    //horizontal movement commit
    x+=hSpeed;
    
    //vertical tiles
    if(tilemap_get_at_pixel(collisionmap,_x,_y+vSpeed)){
        y-=y mod TILESIZE;
        if(sign(vSpeed)==1) y+= TILESIZE -1;
        vSpeed=0;
        _collision=true;    
    }
    y+=vSpeed;
    
    //vertical movement commit
    y+=vSpeed;
    
    
    
    return _collision
}