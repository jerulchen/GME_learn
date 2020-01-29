/// @description Insert description here
// You can write your code in this editor

image_angle += 2;
if (speed >= 1)
{
speed -= 0.1;

}
if (image_alpha >= 0 )
{
	image_alpha -= 0.02;

}
else
{
instance_destroy();
}