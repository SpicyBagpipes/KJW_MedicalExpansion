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

[
	"CAManBase",
	"slotitemchanged",
	{
		params ["_unit"];
		
		if (isPlayer _unit) exitWith {}; //Is handled by unit player EH.
		private _newPPE = _unit call FUNC(processPPE);
		_unit setVariable [QGVAR(ppe), _newPPE];
	}
] call CBA_fnc_addClassEventHandler;

[
	"CAManBase",
	"init",
	{
		params ["_unit"];
		
		private _newPPE = _unit call FUNC(processPPE);
		_unit setVariable [QGVAR(ppe), _newPPE];
	}
] call CBA_fnc_addClassEventHandler;

[
	"unit",
	{
		private _newPPE = ace_player call FUNC(processPPE);
		ace_player setVariable [QGVAR(ppe), _newPPE];
	}
] call CBA_fnc_addPlayerEventHandler;