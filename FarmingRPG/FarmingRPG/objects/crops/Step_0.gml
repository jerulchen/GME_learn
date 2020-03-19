
#region planting
if keyboard_check_pressed(ord("P"))
{
	planting = !planting
}


if planting
{
	if mouse_wheel_up() selectCrop += 1;
	if mouse_wheel_down() selectCrop -= 1;
	
	if (selectCrop > sprite_get_number(spr_crops_picked)-1) selectCrop = 0;
	else if (selectCrop < 0) selectCrop = sprite_get_number(spr_crops_picked) - 1;
	
	mx = mouse_x;
	my = mouse_y;
	if mouse_check_button_pressed(mb_left)
	{
		instance_create_corp(mx, my, selectCrop);
	}

}
#endregion


if instance_exists(obj_crop) && keyboard_check_pressed(ord("G"))
{
	with(obj_crop)
	{
		if growthStage < maxGrowthStage
		{
			daysOld += 1;
			
			//first growth
			var firstGrowth = 0;
			if daysOld > 0 firstGrowth = 1;
			
			growthStage = firstGrowth + (daysOld div growthStageDuration);
		}
		else
		{
			growthStage = maxGrowthStage;
			fullyGrown = true;
			alarm[1] = 1;
		}
		
	}	
}
