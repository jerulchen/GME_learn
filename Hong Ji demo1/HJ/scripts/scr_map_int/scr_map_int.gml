with(obj_floor) instance_destroy();
timer = 200;
obj_player.x = room_width / 2 + 32 ;
obj_player.y = room_height / 2 + 48 ;
dx = obj_player.x&~63;
dy = obj_player.y&~63;