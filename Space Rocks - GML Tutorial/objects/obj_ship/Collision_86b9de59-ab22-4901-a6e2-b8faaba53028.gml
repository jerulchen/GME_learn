/// @description Insert description here
// You can write your code in this editor
global.shiprespawnx = x
global.shiprespawny = y
instance_destroy()
audio_play_sound(snd_die, 1, false);
with(other)
{
instance_destroy();
}
repeat(45)
{
instance_create_layer(x,y,"Instances",obj_debris);
}



lives -= 1;

//这里需要注意，alarm也是会有归属的，直接创建的话，是给当前instance创建的！
obj_game.alarm[1] = room_speed * 3;
obj_game.alarm[2] = 0;
gun = "NORMAL";
repeat(100)

{
instance_create_layer(x,y,"Instances",obj_debris);
}