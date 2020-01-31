/// @description Insert description here
// You can write your code in this editor

if (room == rm_game)
{
	if (audio_is_playing(msc_song))
	{
	audio_stop_sound(msc_song)
	}
	audio_play_sound(msc_song, 2 ,true);
repeat(6)
	{
	var xx = choose(irandom_range(0, obj_ship.x*0.5),irandom_range((room_width-obj_ship.x) * 0.5 ,room_width));
	var yy = choose(irandom_range(0, obj_ship.y * 0.5) , irandom_range((room_height - obj_ship.y) * 0.5, room_height));
	
	instance_create_layer(xx,yy,"Instances",obj_asteroid);
	
	}
	gun= "NORMAL" ;
	alarm[0] = 60;
	alarm[3] = room_speed * 5 ;
	
	obj_ship.alarm[2] = skillcd / 2 * room_speed;
	

}

if (room == rm_boss)
{
	if (audio_is_playing(msc_song))
	{
		audio_stop_sound(msc_song);
	
	}
	audio_play_sound(msc_song, 2, true);
	
	alarm[4] = room_speed * 5;
	

}