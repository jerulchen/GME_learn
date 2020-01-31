/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_ship))
{
	
	var pd = point_direction(x,y, global.ship_x,global.ship_y);
	var dd = angle_difference(image_angle,pd);
	
	image_angle -= min(abs(dd),0.6)  * sign(dd);
	direction = image_angle;
//	if(distance_to_object(obj_ship) >= 100 && abs(angle))
//	{
////move_towards_point(global.ship_x,global.ship_y,speed);
////image_angle = direction ; 
////image_angle = point_direction(x , y , global.ship_x, global.ship_y);
////direction = point_direction(x , y , global.ship_x, global.ship_y);
//	}


}


if (speed <10)
{
speed += 0.02
}