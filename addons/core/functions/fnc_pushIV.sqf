#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Pushes datafluids through IV.
 * 
 *  Arguments:
 *  0: Medic <OBJECT>
 *  1: Patient <OBJECT>
 *  2: Body Part <STRING>
 *  3: Treatment <STRING> <UNUSED>
 *  4: User <OBJECT> <UNUSED>
 *  5: Used Item <STRING> <UNUSED>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [[bob, ted], false] call KJW_MedicalExpansion_Core_fnc_pushIV
 * 
 *  Public: No
 */


params ["_medic", "_patient", "_bodyPart", "_treatment", "_user", "_usedItem"];

private _fluidUsed = _medic getVariable [QGVAR(selectedFluid), ""];
if (_fluidUsed isEqualTo "") exitWith {};
private _fluidInfo = GVAR(fluidData) get _fluidUsed;
_medic setVariable [QGVAR(lastUsedFluid), _fluidUsed, true];
_medic removeItem _fluidUsed; //selectedFluid stuff is handled by EH.

private _treatmentType = switch (true) do {
	case ("_250_" in _fluidUsed): {"BloodIV_250"}; //_250_ ensures it doesn't get conflicts with ID
	case ("_500_" in _fluidUsed): {"BloodIV_500"};
	default {"BloodIV"};
};

[_medic, _patient, _bodyPart, _treatmentType, objNull, _fluidInfo#0] call ace_medical_treatment_fnc_ivBag;