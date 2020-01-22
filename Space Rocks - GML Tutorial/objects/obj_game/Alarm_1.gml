/// @description Insert description here
// You can write your code in this editor

if (room != rm_game) 
{
exit;
}

if (lives >=1 & !instance_exists(obj_ship))
{
instance_create_layer(global.shiprespawnx,global.shiprespawny,"Instances",obj_ship);
repeat(100)
{
instance_create_layer(global.shiprespawnx,global.shiprespawny,"Instances",obj_debris_shiprespawn);
}
}