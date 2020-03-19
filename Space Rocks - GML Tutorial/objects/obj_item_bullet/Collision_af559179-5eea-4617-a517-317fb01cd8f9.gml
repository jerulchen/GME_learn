/// @description Insert description here
// You can write your code in this editor

if (gun = "SHOTGUN")
{
	if (shotgun_level < shotgun_level_max)
	{
	shotgun_level ++
	}
}

else
{
gun = "SHOTGUN";
shotgun_level = 0;

}


//if (obj_game.alarm[2] >0)
//{
//obj_game.alarm [2] += 600;
//}

//else
//{
//obj_game.alarm [2] = 600;
//}



instance_destroy();


repeat (25)
{

instance_create_layer(x , y , "Instances", obj_effect_star);

}