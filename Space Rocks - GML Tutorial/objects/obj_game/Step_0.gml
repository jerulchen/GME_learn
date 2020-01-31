/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_enter))
{
switch(room)
	{
	case rm_start:
		room_goto(rm_game);
		break;
	case rm_gameover:
	case rm_win:
		game_restart();
		break;
	
	
	}

}


if room == rm_game
{
if score >=  500
	{
	audio_play_sound(snd_win,1,false);
	room_goto(rm_boss);
	}
if lives <= 0
	{
		audio_play_sound(snd_lose,1,false);
	room_goto(rm_gameover);
	}
	
	
	
}

if room == rm_boss
{
if lives <= 0
	{
		audio_play_sound(snd_lose,1,false);
	room_goto(rm_gameover);
	}
}

if (room = rm_boss)
{
	if (bosslives <= 0)
	{
	room_goto(rm_win);
	
	}

}


if (room == rm_boss || room == rm_game)
{
gametime += 1
}

if (shiplevel <= shipmaxlevel)
{
shiplevel = floor(score / 100);
}

shootspd = 200 + shiplevel/(shiplevel +20)  * 600;
