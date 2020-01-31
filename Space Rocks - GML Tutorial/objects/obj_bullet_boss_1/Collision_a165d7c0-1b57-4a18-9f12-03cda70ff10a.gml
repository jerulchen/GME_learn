/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor


instance_destroy();
audio_play_sound(snd_die, 1, false);
with(other)
{
switch(sprite_index)
{
	case spr_asteroid_huge :
	repeat(2)
	{
	var new_asteroid = instance_create_layer(x , y , "Instances", obj_asteroid);
	new_asteroid.sprite_index = spr_asteroid_med;
	
	}
	break;
	
	case spr_asteroid_med :
	repeat(2)
	{
	var new_asteroid = instance_create_layer(x , y , "Instances" , obj_asteroid);
	new_asteroid.sprite_index = spr_asteroid_small	;
	}
	break;
}
instance_destroy();
}

repeat(25)
{
instance_create_layer(x,y,"Instances", obj_debris);
}