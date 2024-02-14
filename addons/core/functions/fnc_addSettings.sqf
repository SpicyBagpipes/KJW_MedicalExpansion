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