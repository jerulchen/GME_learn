/// @DnDAction : YoYo Games.Common.Get_Global
/// @DnDVersion : 1
/// @DnDHash : 2CD2F4FE
/// @DnDArgument : "output" "shoot_bullettype"
/// @DnDArgument : "var" "char_bullettype"
shoot_bullettype = global.char_bullettype;

/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 05B6FCFC
/// @DnDArgument : "expr" "shoot_bullettype"
var l05B6FCFC_0 = shoot_bullettype;
switch(l05B6FCFC_0)
{
	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 47DFB64A
	/// @DnDParent : 05B6FCFC
	/// @DnDArgument : "const" ""0""
	case "0":
		/// @DnDAction : YoYo Games.Instances.Create_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 3FD1FE71
		/// @DnDParent : 47DFB64A
		/// @DnDArgument : "xpos_relative" "1"
		/// @DnDArgument : "ypos_relative" "1"
		/// @DnDArgument : "var" "newBullet"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "objectid" "obj_bullet"
		/// @DnDSaveInfo : "objectid" "75fbc290-b225-4e5c-a3d6-dcc040e244a3"
		var newBullet = instance_create_layer(x + 0, y + 0, "Instances", obj_bullet);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 5920EAF2
		/// @DnDParent : 47DFB64A
		/// @DnDArgument : "expr" "image_angle"
		/// @DnDArgument : "var" "newBullet.direction"
		newBullet.direction = image_angle;
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 1C8D76BB
	/// @DnDParent : 05B6FCFC
	/// @DnDArgument : "const" ""shotgun""
	case "shotgun":
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6FCCACBD
		/// @DnDInput : 2
		/// @DnDParent : 1C8D76BB
		/// @DnDArgument : "expr" "90"
		/// @DnDArgument : "expr_1" "8"
		/// @DnDArgument : "var" "shotgun_ragne"
		/// @DnDArgument : "var_1" "shotgun_amt"
		shotgun_ragne = 90;
		shotgun_amt = 8;
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 77FAF165
		/// @DnDParent : 1C8D76BB
		/// @DnDArgument : "expr" "shotgun_ragne/(shotgun_amt-1)"
		/// @DnDArgument : "var" "shotgun_rangestep"
		shotgun_rangestep = shotgun_ragne/(shotgun_amt-1);
	
		/// @DnDAction : YoYo Games.Instances.Create_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 0845E32F
		/// @DnDParent : 1C8D76BB
		/// @DnDArgument : "xpos_relative" "1"
		/// @DnDArgument : "ypos_relative" "1"
		/// @DnDArgument : "var" "newBullet"
		/// @DnDArgument : "var_temp" "1"
		/// @DnDArgument : "objectid" "obj_bullet_shotgun"
		/// @DnDSaveInfo : "objectid" "a8055a93-20f7-4e3d-8c20-91b920b77526"
		var newBullet = instance_create_layer(x + 0, y + 0, "Instances", obj_bullet_shotgun);
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 64BC36FB
		/// @DnDInput : 2
		/// @DnDParent : 1C8D76BB
		/// @DnDArgument : "expr" "image_angle-(shotgun_ragne/2)"
		/// @DnDArgument : "expr_1" "1"
		/// @DnDArgument : "var" "newBullet.direction"
		/// @DnDArgument : "var_1" "shotgun_count"
		newBullet.direction = image_angle-(shotgun_ragne/2);
		shotgun_count = 1;
	
		/// @DnDAction : YoYo Games.Loops.Loop
		/// @DnDVersion : 1
		/// @DnDHash : 307EA5E3
		/// @DnDParent : 1C8D76BB
		while(true)
		{
			/// @DnDAction : YoYo Games.Common.If_Variable
			/// @DnDVersion : 1
			/// @DnDHash : 4283DFC5
			/// @DnDParent : 307EA5E3
			/// @DnDArgument : "var" "shotgun_count"
			/// @DnDArgument : "op" "4"
			/// @DnDArgument : "value" "shotgun_amt"
			if(shotgun_count >= shotgun_amt)
			{
				/// @DnDAction : YoYo Games.Loops.Break
				/// @DnDVersion : 1
				/// @DnDHash : 781546EF
				/// @DnDParent : 4283DFC5
				break;
			}
		
			/// @DnDAction : YoYo Games.Common.Else
			/// @DnDVersion : 1
			/// @DnDHash : 2FB1B930
			/// @DnDParent : 307EA5E3
			else
			{
				/// @DnDAction : YoYo Games.Instances.Create_Instance
				/// @DnDVersion : 1
				/// @DnDHash : 1C1A81C3
				/// @DnDParent : 2FB1B930
				/// @DnDArgument : "xpos_relative" "1"
				/// @DnDArgument : "ypos_relative" "1"
				/// @DnDArgument : "var" "newBullet"
				/// @DnDArgument : "var_temp" "1"
				/// @DnDArgument : "objectid" "obj_bullet_shotgun"
				/// @DnDSaveInfo : "objectid" "a8055a93-20f7-4e3d-8c20-91b920b77526"
				var newBullet = instance_create_layer(x + 0, y + 0, "Instances", obj_bullet_shotgun);
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 7BDF600A
				/// @DnDParent : 2FB1B930
				/// @DnDArgument : "expr" "image_angle-(shotgun_ragne/2)+shotgun_rangestep*shotgun_count"
				/// @DnDArgument : "var" "newBullet.direction"
				newBullet.direction = image_angle-(shotgun_ragne/2)+shotgun_rangestep*shotgun_count;
			
				/// @DnDAction : YoYo Games.Common.Variable
				/// @DnDVersion : 1
				/// @DnDHash : 32321FCC
				/// @DnDParent : 2FB1B930
				/// @DnDArgument : "expr" "1"
				/// @DnDArgument : "expr_relative" "1"
				/// @DnDArgument : "var" "shotgun_count"
				shotgun_count += 1;
			}
		}
		break;
}