/// @description Insert description here
// You can write your code in this editor

if (room != rm_game & instance_exists(obj_ship)) 
{
exit;
}

if (choose(0,1) == 0)
{
	if (obj_ship.x < room_width * 0.5)
	{
	var xx = room_width;
	var yy = irandom_range (0, room_height);
	}
	else
	{
	var xx = 0;
	var yy = irandom_range (0, room_height);
	}

}
else
{
	if ( obj_ship.y < room_height * 0.5 )
	{
	var xx = irandom_range(0, room_width);
	var yy = room_height;
	}
	else
	{
	var xx = irandom_range(0, room_width);
	var yy = 0;
	}

}

if (!instance_exists(obj_item_bullet))
{
	if (choose(0,1) ==1)
	{
	var item_bullet_xx = irandom_range(0 , room_width);
	var item_bullet_yy = choose(0 , room_height);
	}
	else
	{
	var item_bullet_xx = choose(0 , room_width);
	var item_bullet_yy = irandom_range(0 , room_height);
	}

instance_create_layer(item_bullet_xx,item_bullet_yy,"Instances",obj_item_bullet);

}
	instance_create_layer(xx,yy,"Instances",obj_asteroid);

	alarm[0] = 4 * room_speed;

