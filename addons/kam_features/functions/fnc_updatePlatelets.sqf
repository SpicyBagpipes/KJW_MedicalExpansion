#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Update KAM platelet variable based on unit's platelet count
 * 
 *  Arguments:
 *  0: Patient <OBJECT>
 *  1: Delta Time <NUMBER>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player, 1] call KJW_MedicalExpansion_KAM_Features_fnc_updatePlatelets
 * 
 *  Public: No
 */

params ["_patient", "_deltaT"];

private _bloodInfo = _patient getVariable [QEGVAR(core,bloodInfo), createHashmap];
private _KAMCoagulation = (_patient getVariable ["kat_pharma_coagulationFactor", 10]) max 1;
private _plateletCount = _bloodInfo get "Platelet"; // 0-24 value, where 24 is maximum.
private _timeToTake = 1.5*_plateletCount;

if (_plateletCount > 18) exitWith {};

private _plateletMultiplier = 24/(_plateletCount min 24);

private _roll = random _timeToTake*_deltaT;

if (_roll < _plateletMultiplier*_deltaT) then {
	_patient setVariable ["kat_pharma_coagulationFactor", _KAMCoagulation - 1, true];
};