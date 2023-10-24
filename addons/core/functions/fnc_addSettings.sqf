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


[
	QGVAR(vestBlocksCPR),
	"CHECKBOX",
	["Vest Blocks CPR", "Enable to have vest with > 10 ballistic protection block CPR from being done."],
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
	QGVAR(respirators),
	"EDITBOX",
	["Respirators", "Array of respirator classnames. Use #ANY for everything to be a respirator. Use '' for nothing to be a respirator"],
	["KJW's Medical Expansion", "Configuration"],
	str []
] call CBA_fnc_addSetting;