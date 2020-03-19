/// @description Insert description here
// You can write your code in this editor

var dx = 0, dy = 0;
if (keyboard_check(vk_up))
{
	dy = -1;
	image_index += ip;
	
}

if (keyboard_check(vk_down))
{
	dy = 1;
	image_index += ip;
	
}

if (keyboard_check(vk_left))
{
	dx = -1;
	face = -1;
	image_index +=ip;
	

}

if (keyboard_check(vk_right))

{
	dx = 1;
	face = 1;
	image_index +=ip;
}

//** 物体碰撞

if (place_meeting(x+dx*sp,y,obj_wall))
{
	move_contact_solid(point_direction(0,0,dx,0),sp);
	dx = 0;
}
if (place_meeting(x,y+dy*sp,obj_wall))
{
	move_contact_solid(point_direction(0,0,0,dy),sp);
	dy = 0;
}


//****碰撞贴图
var tile_id = layer_get_id("Tiles_wall");
tile_id = layer_tilemap_get_id(tile_id);
if(tilemap_get_at_pixel(tile_id,x+dx*sp,y+dy*sp))
{
	dx = 0;
	dy = 0;
}


x += dx*sp;
y += dy*sp;