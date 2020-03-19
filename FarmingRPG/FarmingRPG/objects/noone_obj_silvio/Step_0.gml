scr_get_input();


spd = nor_speed;
moveX = 0;
moveY = 0;

if input_run || input_walk 
{
	spd = abs(input_run * run_speed - input_walk * walk_speed);
}
else
{
	spd = nor_speed;
}

if input_left || input_right
{
	moveX = input_right * spd - input_left * spd;
}
else
{
	moveY = input_down * spd - input_up * spd;
}




//show_debug_message(string(input_right)+" & " + string(input_left));

x += moveX;
y += moveY;