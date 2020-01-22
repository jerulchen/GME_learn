/// @description Insert description here
// You can write your code in this editor


if (speed >= 1)
{
speed -= 0.1;
}
image_alpha -= 0.01;
if (image_alpha <= 0)
{
instance_destroy();

}
