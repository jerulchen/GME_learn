/// @description Insert description here
// You can write your code in this editor

if (room == rm_game)
{
repeat(6)
	{
	var xx = choose(irandom_range(0, obj_ship.x*0.5),irandom_range((room_width-obj_ship.x) * 0.5 ,room_width));
	var yy = choose(irandom_range(0, obj_ship.y * 0.5) , irandom_range((room_height - obj_ship.y) * 0.5, room_height));
	
	instance_create_layer(xx,yy,"Instances",obj_asteroid);
	
	}
	alarm[0] = 60;
	

}
