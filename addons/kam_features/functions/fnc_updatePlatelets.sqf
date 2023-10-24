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

private _timeToTake = 60;

private _bloodInfo = _patient getVariable [QEGVAR(core,bloodInfo), createHashmap];
private _KAMClottingFactors = (_patient getVariable ["kat_pharma_coagulationFactor", 10]) min GVAR(maximumCoagulationFactor);
private _plateletCount = _bloodInfo get "Platelet"; // 0-24 value, where 24 is maximum. Needs to be a 100% chance every 60 seconds at 24 platelet.
private _plateletMultiplier = (_plateletCount min 24)/24;

/*
	1/60*_deltaT = once every minute on average.

	_plateletCount/24 = platelet count multiplier.

				_deltaT
	________________________________
	(60*_deltaT)*(_plateletCount/24)
*/

private _roll = random _timeToTake*_deltaT;

if (_roll < _plateletMultiplier*_deltaT) then {
	_patient setVariable ["kat_pharma_coagulationFactor", _KAMClottingFactors + 1, true];
};