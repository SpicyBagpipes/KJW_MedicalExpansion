#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds CBA settings required for module to function
 * 
 *  Arguments:
 *  None
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
	["Lung Size", "Chance for lung injury on a torso hit"],
	["KJW's Medical Expansion", "Airways"],
	[0, 0.8, 0.4, 0, true], // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;

[
	QGVAR(overpenCoef),
	"SLIDER",
	["Overpenetration Threshold", "How much damage must be intercepted by armour for it to count as overpenetration?"],
	["KJW's Medical Expansion", "Airways"],
	[0, 0.2, 0.1, 0, true], // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;
