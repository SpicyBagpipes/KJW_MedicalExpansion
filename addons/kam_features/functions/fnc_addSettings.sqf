#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds settings required for the addon to function.
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_KAM_Features_fnc_addSettings
 * 
 *  Public: No
 */

[
	QGVAR(maximumCoagulationFactor),
	"SLIDER",
	["Maximum Coagulation Factor", "Maximum number of coagulation factors that unit can have at once"],
	["KJW's Medical Expansion", "KAM Modifiers"],
	[0, 30, 10, 0], // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;