/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 18EDF180
/// @DnDArgument : "value" ""shotgun""
/// @DnDArgument : "var" "char_bullettype"
global.char_bullettype = "shotgun";

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 6EBBAB35
/// @DnDApplyTo : 7eaf8bc0-6011-4b24-9af8-509f42e3e9c0
with(obj_game) {
	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 75111E76
	/// @DnDParent : 6EBBAB35
	/// @DnDArgument : "steps" "600"
	/// @DnDArgument : "alarm" "2"
	alarm_set(2, 600);
}

/// @DnDAction : YoYo Games.Common.Apply_To
/// @DnDVersion : 1
/// @DnDHash : 558878D4
/// @DnDApplyTo : other
with(other) {
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 2E56F895
	/// @DnDParent : 558878D4
	instance_destroy();
}