#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Handles postinit for the addon
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_PPE_XEH_PostInit
 * 
 *  Public: No
 */

GVAR(PPE) = createHashmap;
GVAR(PPERequirements) = createHashmap;

/*
[
	"CAManBase",
	"slotitemchanged",
	{
		params ["_unit"];
		
		if (isPlayer _unit || !local _unit) exitWith {}; //Is handled by unit player EH.
		private _newPPE = _unit call FUNC(processPPE);
		_unit call FUNC(hoseInit);
		_unit setVariable [QGVAR(ppe), _newPPE];
	}
] call CBA_fnc_addClassEventHandler;
Doesn't work for some reason, causes game freezes!
*/

[
	"CAManBase",
	"init",
	{
		params ["_unit"];
		
		if (!local _unit) exitWith {};
		private _newPPE = _unit call FUNC(processPPE);
		_unit setVariable [QGVAR(ppe), _newPPE, true];
	}
] call CBA_fnc_addClassEventHandler;

[
	"loadout",
	{
		private _newPPE = ace_player call FUNC(processPPE);
		ace_player setVariable [QGVAR(ppe), _newPPE, true];
		if ("arsenal" in toLower (call CBA_fnc_getActiveFeatureCamera)) exitWith {};
		ace_player call FUNC(hoseInit); // Check if in arsenal or not
	},
	true,
	[],
	true
] call CBA_fnc_addPlayerEventHandler;

[
	"ace_arsenal_displayClosed",
	{
		ACE_Player call FUNC(hoseInit);
	}
] call CBA_fnc_addEventHandler;
