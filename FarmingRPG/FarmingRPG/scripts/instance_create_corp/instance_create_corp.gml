///@description instance_create_crop
///@arg x
///@arg y
///@arg crop_type


var cs = crops.cellSize;
var _x = argument0 div cs;
var _y = argument1 div cs;
var i_grid = crops.ds_crops_instances;

var cell = i_grid[# _x, _y];
if cell ==0
{

	xx = _x * cs;
	yy = _y * cs;

	//check for soil

	var lay_id = layer_get_id("T_soil");
	var map_id = layer_tilemap_get_id(lay_id);

	var data = tilemap_get_at_pixel(map_id, argument0, argument1);


	if data == 0
	{
		return false;
	}


	//create the instance
	var inst = instance_create_layer(xx + cs/2, yy + cs/2, "instances",obj_crop);
	i_grid[# _x,_y] = inst;

	//give the crop its characteristics
	with(inst)
	{
		cropType = argument2;
		growthStageDuration = crops.ds_crops_types[# 0, cropType];
	
	}

	return inst;

}
else
{
	show_debug_message("there si already someting there");
	return false;
}