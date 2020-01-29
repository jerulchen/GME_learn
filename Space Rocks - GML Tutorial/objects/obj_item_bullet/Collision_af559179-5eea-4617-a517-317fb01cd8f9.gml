/// @description Insert description here
// You can write your code in this editor

gun = "SHOTGUN";

if (obj_game.alarm[2] >0)
{
obj_game.alarm [2] += 600;
}

else
{
obj_game.alarm [2] = 600;
}


instance_destroy();


repeat (25)
{

instance_create_layer(x , y , "Instances", obj_effect_star);

}