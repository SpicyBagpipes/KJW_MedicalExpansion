#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Handles calling symptom events for local unit
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 *  1: Time since last call <NUMBER>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player, 1] call KJW_MedicalExpansion_Symptoms_fnc_unitProcess
 * 
 *  Public: No
 */

params ["_unit", "_deltaT"];

{
    private _amount = _unit getVariable [_x, 0]; // 2*Frequency, not time period
    if (_amount <= 0) then {continue};
    _amount = _amount/2;
    private _roll = random _deltaT; // Shouldn't deviate much from 1
    if (_amount < _roll) then {continue};
    private _delayRoll = random 5; // random 0.5 has issues with being weighted closer to 0 iirc. If these have been fixed, change to random 5.
    _delayRoll = _delayRoll/10;

    [{
        params ["_event", "_unit"];
        [_event, [_unit]] call CBA_fnc_globalEvent;
    }, [_x, _unit], _delayRoll] call CBA_fnc_waitAndExecute;

    break;
} forEach [QGVAR(cough), QGVAR(sneeze), QGVAR(sniff)];
