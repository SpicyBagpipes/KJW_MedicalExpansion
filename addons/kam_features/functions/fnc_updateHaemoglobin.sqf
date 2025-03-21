#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Update KAM SpO2 variable based on unit's RBC count
 * 
 *  Arguments:
 *  0: unit <OBJECT>
 *  1: Delta Time <NUMBER>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player, 1] call KJW_MedicalExpansion_KAM_Features_fnc_updateHaemoglobin
 * 
 *  Public: No
 */

params ["_patient", "_deltaT"];

if (!GVAR(doRBCeffects)) exitWith {};

private _bloodInfo = _patient getVariable [QEGVAR(core,bloodInfo), createHashmapFromArray GVAR(defaultBloodInfo)];
private _KAMSpO2 = _patient getVariable ["kat_breathing_airwayStatus", 100];
private _haemoCount = _bloodInfo get "RBC"; // 0-24 value, where 24 is maximum.
_haemoCount = _haemoCount max 0.01;
private _timeToTake = _haemoCount;

if (_haemoCount > 18) exitWith {};

private _haemoMultiplier = 24/(_haemoCount min 24);

private _roll = random _timeToTake*_deltaT;

if (_roll < _haemoMultiplier*_deltaT) then {
	_patient setVariable ["kat_breathing_airwayStatus", (_KAMSpO2 - 1) max 0, true];
};