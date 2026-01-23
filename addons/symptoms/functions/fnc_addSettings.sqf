#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds settings required for the mod to function
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_Symptoms_fnc_addSettings
 * 
 *  Public: No
 */

[
	QGVAR(reducedMotion),
	"CHECKBOX",
	["Reduced motion", "Toggles camera shake and other effects from symptoms"],
	["KJW's Medical Expansion", "Accessibility"],
	false, // Default value
	1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0)
	{}, // Setting changed code
	false // Requires restart
] call CBA_fnc_addSetting;
