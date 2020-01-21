/// @description Insert description here
// You can write your code in this editor

image_alpha = image_alpha - 0.01;
if (image_alpha <= 0 )
{
instance_destroy();
}

speed = speed - 0.1;
if(speed <= 0.3)
{
speed = 0.3;
}