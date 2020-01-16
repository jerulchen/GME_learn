/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 173E58AB
/// @DnDArgument : "var" "room"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "rm_game"
if(!(room == rm_game))
{
	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 6BEC39FE
	/// @DnDParent : 173E58AB
	exit;
}

/// @DnDAction : YoYo Games.Random.Choose
/// @DnDVersion : 1
/// @DnDHash : 1E2BEEAD
/// @DnDInput : 2
/// @DnDArgument : "var" "choice"
/// @DnDArgument : "var_temp" "1"
/// @DnDArgument : "option_1" "1"
var choice = choose(0, 1);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 6791AD39
/// @DnDArgument : "var" "choice"
if(choice == 0)
{
	/// @DnDAction : YoYo Games.Random.Choose
	/// @DnDVersion : 1
	/// @DnDHash : 35B20154
	/// @DnDInput : 2
	/// @DnDParent : 6791AD39
	/// @DnDArgument : "var" "xx"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "option" "room_width"
	var xx = choose(room_width, 0);

	/// @DnDAction : YoYo Games.Random.Get_Random_Number
	/// @DnDVersion : 1
	/// @DnDHash : 7AEACB65
	/// @DnDParent : 6791AD39
	/// @DnDArgument : "var" "yy"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "max" "room_height"
	var yy = (random_range(0, room_height));
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 3158F260
else
{
	/// @DnDAction : YoYo Games.Random.Choose
	/// @DnDVersion : 1
	/// @DnDHash : 13AAB840
	/// @DnDInput : 2
	/// @DnDParent : 3158F260
	/// @DnDArgument : "var" "yy"
	/// @DnDArgument : "option" "room_height"
	yy = choose(room_height, 0);

	/// @DnDAction : YoYo Games.Random.Get_Random_Number
	/// @DnDVersion : 1
	/// @DnDHash : 3E21CB2D
	/// @DnDParent : 3158F260
	/// @DnDArgument : "var" "xx"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "max" "room_width"
	var xx = (random_range(0, room_width));
}

/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 45164C92
/// @DnDArgument : "xpos" "xx"
/// @DnDArgument : "ypos" "yy"
/// @DnDArgument : "objectid" "obj_asteroid"
/// @DnDSaveInfo : "objectid" "97e8affe-05b4-406c-96d2-2d6973ae0443"
instance_create_layer(xx, yy, "Instances", obj_asteroid);

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 71861F99
/// @DnDArgument : "steps" "room_speed*4"
alarm_set(0, room_speed*4);

/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 0EFF8CFF
/// @DnDArgument : "obj" "obj_ship"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "obj" "0160b587-7c27-4bb6-8149-b689217dc8ef"
var l0EFF8CFF_0 = false;
l0EFF8CFF_0 = instance_exists(obj_ship);
if(!l0EFF8CFF_0)
{
	/// @DnDAction : YoYo Games.Instance Variables.If_Lives
	/// @DnDVersion : 1
	/// @DnDHash : 13CF8E92
	/// @DnDParent : 0EFF8CFF
	/// @DnDArgument : "op" "4"
	/// @DnDArgument : "value" "1"
	if(!variable_instance_exists(id, "__dnd_lives")) __dnd_lives = 0;
	if(__dnd_lives >= 1)
	{
		/// @DnDAction : YoYo Games.Instances.Create_Instance
		/// @DnDVersion : 1
		/// @DnDHash : 417CC987
		/// @DnDParent : 13CF8E92
		/// @DnDArgument : "xpos" "x_shipDestory"
		/// @DnDArgument : "ypos" "y_shipDestory"
		/// @DnDArgument : "objectid" "obj_ship"
		/// @DnDSaveInfo : "objectid" "0160b587-7c27-4bb6-8149-b689217dc8ef"
		instance_create_layer(x_shipDestory, y_shipDestory, "Instances", obj_ship);
	
		/// @DnDAction : YoYo Games.Loops.Repeat
		/// @DnDVersion : 1
		/// @DnDHash : 4AC16D33
		/// @DnDParent : 13CF8E92
		/// @DnDArgument : "times" "50"
		repeat(50)
		{
			/// @DnDAction : YoYo Games.Instances.Create_Instance
			/// @DnDVersion : 1
			/// @DnDHash : 2262C3E5
			/// @DnDParent : 4AC16D33
			/// @DnDArgument : "xpos" "x_shipDestory"
			/// @DnDArgument : "ypos" "y_shipDestory"
			/// @DnDArgument : "objectid" "obj_debris"
			/// @DnDSaveInfo : "objectid" "9e081d8a-1862-40af-b58a-a54719cbe990"
			instance_create_layer(x_shipDestory, y_shipDestory, "Instances", obj_debris);
		}
	}
}