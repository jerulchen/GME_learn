/// @description Insert description here
// You can write your code in this editor
score += 10;
instance_destroy();
audio_play_sound(snd_die, 1, false);
with(other)
{
instance_destroy();

if (sprite_index == spr_asteroid_huge)
{
repeat(2)
{
var new_asteroid = instance_create_layer(x,y,"Instances" , obj_asteroid);
new_asteroid.sprite_index = spr_asteroid_med;
}
}
else if (sprite_index == spr_asteroid_med)
{
repeat(2)
{
var new_asteroid = instance_create_layer(x,y,"Instances" , obj_asteroid);
new_asteroid.sprite_index = spr_asteroid_small;
}
}
repeat(25)
{
instance_create_layer(x,y,"Instances", obj_debris);
}


if (irandom_range(1,10) == 1 & !instance_exists(obj_item_1up))
{
	instance_create_layer(x,y,"Instances", obj_item_1up);
	
}
}
