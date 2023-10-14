#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Handles coagulation for units.
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 *  1: Time since last call <NUMBER>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player, 1] call KJW_MedicalExpansion_Core_fnc_coagulationLoop
 * 
 *  Public: No
 */


params ["_unit", "_deltaT"];

private _openWounds = _unit getVariable ["ace_medical_openwounds", []];
private _medications = _unit getVariable ["ace_medical_medications", []];
private _bloodInfo = _unit getVariable QGVAR(bloodInfo);
private _plateletcount = _bloodInfo get "Platelet"; // 0-24.

{
	_x params ["", "_bodyPartN", "_amountOf", "_bleeding"];
	// Handle chance of wound clotting.
	if (_plateletcount > 0) then {
		_effectiveCount = _plateletcount/1000*_deltaT; // Reduce it to be in keeping with _bleeding amount.
		_bleeding = _bleeding - _effectiveCount;	
	};

	// If TXA not present:
		// Handle chance of clotting stopping.
} forEach _openWounds;