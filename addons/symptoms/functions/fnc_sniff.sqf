#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Makes unit sniff
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player] call KJW_MedicalExpansion_Symptoms_fnc_sniff
 * 
 *  Public: No
 */

params ["_unit"];

if !(local _unit) exitWith {};

private _sfx = selectRandom [QPATHTOF(data\sfx\sniff_1.wss),QPATHTOF(data\sfx\sniff_2.wss)];

playSound3D [_sfx, _unit];

if (!GVAR(reducedMotion) && _unit == ace_player) then {
    [
        {
            addCamShake [2, 1.5, 50];
        },
        [],
        0.2
    ] call CBA_fnc_waitAndExecute;
};
