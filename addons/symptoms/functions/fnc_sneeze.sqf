#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Makes unit sneeze.
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player] call KJW_MedicalExpansion_Symptoms_fnc_sneeze
 * 
 *  Public: No
 */

params ["_unit"];

if !(local _unit) exitWith {};

private _sfx = selectRandom [QPATHTOF(data\sfx\sneeze_1.wss),QPATHTOF(data\sfx\sneeze_2.wss)];

playSound3D [_sfx, _unit];

if (!GVAR(reducedMotion) && _unit == ace_player) then {
	[
		{
			
			addCamShake [20, 0.5, 100];
		},
		[],
		0.2
	] call CBA_fnc_waitAndExecute;
};