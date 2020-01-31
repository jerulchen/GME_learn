/// @description Insert description here
// You can write your code in this editor
if (room != rm_boss)
{
exit;
}


if (room == rm_boss)
{
if (!instance_exists(obj_boss_01))
{
	instance_create_layer(room_width / 2 , room_height * 0.2, "Instances" , obj_boss_01);

}

}