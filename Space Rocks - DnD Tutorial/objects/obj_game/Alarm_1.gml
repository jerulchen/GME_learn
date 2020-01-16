/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 275E7E12
/// @DnDArgument : "var" "room"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "rm_game"
if(!(room == rm_game))
{
	/// @DnDAction : YoYo Games.Common.Exit_Event
	/// @DnDVersion : 1
	/// @DnDHash : 08F29AD2
	/// @DnDParent : 275E7E12
	exit;
}

/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 3E18ABA7
/// @DnDArgument : "obj" "obj_item_shotgun"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "obj" "b01587e9-3dbf-445e-9c97-8de18327273e"
var l3E18ABA7_0 = false;
l3E18ABA7_0 = instance_exists(obj_item_shotgun);
if(!l3E18ABA7_0)
{
	/// @DnDAction : YoYo Games.Random.Get_Random_Number
	/// @DnDVersion : 1
	/// @DnDHash : 60A9B52C
	/// @DnDParent : 3E18ABA7
	/// @DnDArgument : "var" "xx"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "max" "359"
	var xx = (random_range(0, 359));

	/// @DnDAction : YoYo Games.Random.Get_Random_Number
	/// @DnDVersion : 1
	/// @DnDHash : 1E1B1B16
	/// @DnDParent : 3E18ABA7
	/// @DnDArgument : "var" "yy"
	/// @DnDArgument : "var_temp" "1"
	/// @DnDArgument : "max" "359"
	var yy = (random_range(0, 359));

	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 0CBCFC10
	/// @DnDParent : 3E18ABA7
	/// @DnDArgument : "xpos" "xx"
	/// @DnDArgument : "ypos" "yy"
	/// @DnDArgument : "objectid" "obj_item_shotgun"
	/// @DnDSaveInfo : "objectid" "b01587e9-3dbf-445e-9c97-8de18327273e"
	instance_create_layer(xx, yy, "Instances", obj_item_shotgun);

	/// @DnDAction : YoYo Games.Random.Get_Random_Number
	/// @DnDVersion : 1
	/// @DnDHash : 2BCA1254
	/// @DnDParent : 3E18ABA7
	/// @DnDArgument : "var" "cd_item"
	/// @DnDArgument : "min" "200"
	/// @DnDArgument : "max" "600"
	cd_item = (random_range(200, 600));

	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 72250F61
	/// @DnDParent : 3E18ABA7
	/// @DnDArgument : "steps" "cd_item"
	/// @DnDArgument : "alarm" "1"
	alarm_set(1, cd_item);
}