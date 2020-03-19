randomize();
debug = false;




blackAlpha = 0;

spawnRoom = -1;
doTransition = false;

spawnX = 0;
spawnY = 0;

enum dir
{
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

spawnPlayerFacing = -1;

global.game_width = 750;
global.game_height = 420;

display_set_gui_size(global.game_width, global.game_height);