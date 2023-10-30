#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Withdraws blood from unit and sends event to medic taking blood.
 * 
 *  Arguments:
 *  0: Medic <OBJECT>
 *  1: Patient <OBJECT>
 *  2: Body Part <STRING> <UNUSED>
 *  3: Treatment <STRING>
 *  4: User <OBJECT> <UNUSED>
 *  5: Used Item <STRING>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [[bob, ted], false] call KJW_MedicalExpansion_Core_fnc_drawBlood
 * 
 *  Public: No
 */


params ["_medic", "_patient", "_bodyPart", "_treatment", "_user", "_usedItem"];

private _patientVolume = _patient getVariable ["ACE_Medical_bloodVolume",6];
private _unitData = _patient getVariable [QGVAR(bloodInfo), []];

private _value = switch (true) do {
	case ("250" in _treatment): {["KJW_MedicalExpansion_bloodBag_250",0.25]};
	case ("500" in _treatment): {["KJW_MedicalExpansion_bloodBag_500",0.5]};
	case ("sample" in toLower _treatment): {["KJW_MedicalExpansion_bloodSample",0.01]};
	default {["KJW_MedicalExpansion_bloodBag_1000",0.1]};
};

_value params ["_bloodBag", "_amount"];

_patient setVariable ["ACE_Medical_bloodVolume",_patientVolume-_amount, true];
{
	private _reduction = -_amount*4; //Negative value.
	private _currentVar = _unitData get _x;
	_unitData set [_x, _currentVar+_reduction];
} forEach KJW_MedicalExpansion_Core_BloodTransmissiveInfo;

[QGVAR(giveBlood), [_medic, _patient, _bloodBag], _patient] call CBA_fnc_targetEvent;