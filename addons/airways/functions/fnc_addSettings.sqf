#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Function description
 * 
 *  Arguments:
 *  0: Objects <ARRAY>
 *  1: All <BOOL>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [[bob, ted], false] call KJW_MedicalExpansion_Airways_fnc_addSettings
 * 
 *  Public: No
 */

[
	QGVAR(lungSizeCoef),
	"SLIDER",
	["Lung Size", "Percentage chance for lung injury on a torso hit"],
	["KJW's Medical Expansion", "Airways"],
	[0, 30, 20, 0, 1], // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(overpenCoef),
	"SLIDER",
	["Overpenetration Threshold", "How much damage must be intercepted by armour for it to count as overpenetration?"],
	["KJW's Medical Expansion", "Airways"],
	[0, 20, 10, 0, 1], // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;
