#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds settings required for the mod to function.
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_Core_fnc_addSettings
 * 
 *  Public: No
 */

private _arr = str [];

[
	QGVAR(vestBlocksCPR),
	"CHECKBOX",
	["Vest Blocks CPR", "Enable to have vest with > 10 ballistic protection block CPR from being done"],
	["KJW's Medical Expansion", "Blocking Actions"],
	false, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(leaveBodyRespawn),
	"CHECKBOX",
	["Leave Body Respawn", "Respawn button will cause the player to leave their body and have it taken over by AI. Useful for unconsciousness whilst maintaining fun for medics. ONLY WORKS IN MP."],
	["KJW's Medical Expansion", "Miscellaneous"],
	false, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(leaveBodyRespawnNotify),
	"CHECKBOX",
	["Leave Body Respawn Notify", "Notify all players that the player did not die and instead ascended to a higher plane."],
	["KJW's Medical Expansion","Miscellaneous"],
	false, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(leaveBodyRespawnJoinGroup),
	"CHECKBOX",
	["Leave Body Respawn Join Group", "Make the AI left behind join your group"],
	["KJW's Medical Expansion","Miscellaneous"],
	true, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(leaveBodyRespawnComatose),
	"CHECKBOX",
	["Leave Body Respawn Comatose", "Puts leave body respawn AI into a coma (infinite unconsciousness)"],
	"KJW's Medical Expansion",
	true, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;


[
	QGVAR(kamOverrideBloodGroup),
	"CHECKBOX",
	["Override KAT blood group", "Will override KAT blood group with KJW ME:C blood group if enabled"],
	["KJW's Medical Expansion", "Miscellaneous"],
	false, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	true // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(doRBCeffects),
	"CHECKBOX",
	["Do RBC Effects", "Causes SpO2 to drop if RBC count is low"],
	["KJW's Medical Expansion", "Miscellaneous"],
	false, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	true // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(doPlateleteffects),
	"CHECKBOX",
	["Do Platelet Effects", "Causes clotting to be harder if Platelet count is low"],
	["KJW's Medical Expansion", "Miscellaneous"],
	false, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	true // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(checkRH),
	"CHECKBOX",
	["Check Blood RH", "Disable to make + blood types compatible with - and vice versa"],
	["KJW's Medical Expansion", "Miscellaneous"],
	true, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	true // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(centrifugeCoef),
	"SLIDER",
	["Centrifuge Duration", "Coefficient for the duration of Centrifuges"],
	["KJW's Medical Expansion", "Miscellaneous"],
	[0, 15, 1, 0], // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(ppeCoef),
	"SLIDER",
	["PPE Coefficient", "Coefficient to multiply ppe effectiveness by"],
	["KJW's Medical Expansion", "PPE"],
	[0, 15, 1, 0], // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(bloodIncompatibilityEnabled),
	"CHECKBOX",
	["Blood Incompatability", "Enabled will have blood type incompatability symptoms and such"],
	"KJW's Medical Expansion",
	true, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(ivCapacity),
	"CHECKBOX",
	["IV Capacity", "Enabled will have maximum IV flow rates"],
	"KJW's Medical Expansion",
	false, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;