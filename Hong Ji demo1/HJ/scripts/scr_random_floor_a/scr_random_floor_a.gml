if(place_empty(dx,dy))instance_create_depth(dx, dy, 1, obj_floor);

if(irandom(1))direction = irandom(3);

var xd = lengthdir_x(64,direction * 90);
var yd = lengthdir_y(64,direction * 90);

if(dx+xd < 64 || dx+xd >= room_width - 64) xd = -xd;
if(dy+yd < 64 || dy+yd >= room_height - 64) yd = -yd;

dx += xd;
dy += yd;