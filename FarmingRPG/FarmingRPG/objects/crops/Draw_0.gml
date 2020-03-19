if !planting || room != rm_0 exit;

var cs = cellSize;
var _x = mx div cs;
var _y = my div cs;



//what is in this cell?
var c = c_red;
var cell = ds_crops_instances[# _x, _y];

if cell == 0 
{
	var lay_id = layer_get_id("T_soil");
	var map_id = layer_tilemap_get_id(lay_id);
	var data  = tilemap_get_at_pixel(map_id, mx, my);

	if data != 0
	{
	 c = c_lime;
	}
}
xx = _x*cs;
yy = _y*cs;

draw_rectangle_color(xx, yy, xx+cs, yy+cs, c, c, c, c, true);




//draw the crop icon to be planted

draw_sprite(spr_crops_picked, selectCrop, xx+(cs/2), yy + (cs/2));