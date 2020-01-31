/// @description Insert description here
// You can write your code in this editor
score += 10;
with(other)
{
instance_destroy();
}

repeat(25)
{
instance_create_layer(x,y,"Instances", obj_debris);
}