#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Makes unit cough.
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player] call KJW_MedicalExpansion_Symptoms_fnc_cough
 * 
 *  Public: No
 */

params ["_unit"];

private _sfx = selectRandom [QPATHTOF(data\sfx\cough_1.wss),QPATHTOF(data\sfx\cough_2.wss),QPATHTOF(data\sfx\cough_3.wss),QPATHTOF(data\sfx\cough_4.wss)];

playSound3D [_sfx, _unit];

if (!GVAR(reducedMotion) && _unit == ace_player) then {
	[
		{
			
			addCamShake [10, 2, 20];
		},
		[],
		0.2
	] call CBA_fnc_waitAndExecute;
};