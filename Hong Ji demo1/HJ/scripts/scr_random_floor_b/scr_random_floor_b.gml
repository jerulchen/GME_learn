var tile_id = layer_get_id("Tiles_wall");
tile_id = layer_tilemap_get_id(tile_id);

tilemap_set_at_pixel(tile_id,0,dx,dy);

if (irandom(1))direction = irandom(3)

	var xd = lengthdir_x(64,direction * 90);
	var yd = lengthdir_y(64,direction * 90);
	
	if (dx + xd <64 || dx + xd >= room_width - 64) xd = -xd;
	if (dy + yd <64 || dy + yd >= room_height - 64 ) yd = -yd;
	
dx += xd;
dy += yd;
