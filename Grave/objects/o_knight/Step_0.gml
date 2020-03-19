switch (state)
{

	case "chase":
		#region chase state
		set_state_sprite(s_knight_walk_strip4, 0.4, 0);
		
		chase_state();
		#endregion
		break;
	
	case "attack":
		#region attack state
		set_state_sprite(s_knight_attack_strip12, 0.6, 0);
		
		if animation_hit_frame(4)
		{
			audio_play_sound(a_swipe,3,false);
			create_hitbox(x, y, self, s_skeleton_attack_one_damage, 4, 4, 10, image_xscale);
		
		}
		
		
		if animation_end()
		{
			state = "chase";
		}
		#endregion
		break;
		
	case "knockback":
		#region knockback state
		knockback_state(s_knight_hitstun,"chase");
		#endregion
		break;
		
	case "death":
		#region death state
		
		death_state(s_knight_die_strip6);
		#endregion
		
		break;
	
	
	default:
		show_debug_message("State " +state+ " dose not exists");
		state = "chase";








}