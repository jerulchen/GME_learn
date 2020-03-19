switch (state)
{
	case "chase":
		set_state_sprite(s_boss_walk_strip6, 0.3, 0);
		boss_chase_state();
		boss_knock_back() //boss被攻击时，击退
		break;
	
	case "stall":
		set_state_sprite(s_boss_idle, 0.3, 0);
		if alarm[1] <= 0 
		{
			state = "chase";
		}
		break;
	
	//case "knockback":
		
	//	knockback_state(s_boss_idle,"chase");
		
	//	break;
		
	case "death":
		death_state(s_boss_die_strip5);
		break;
		
		
	case "attack":
		set_state_sprite(s_boss_attack_strip15, 0.5, 0);
		if animation_hit_frame(7)
		{
			audio_play_sound(a_big_hit,4,false);
			audio_play_sound(a_medium_hit,2,false);
			create_hitbox(x, y, self, s_boss_attack_damage, 10, 3, 20, image_xscale);
			add_screenshake(10,15);
			
		}
		if animation_end()
		{
			state = "stall";
			alarm[1] = room_speed * 0.5 ;
		}
		
		break;











}

