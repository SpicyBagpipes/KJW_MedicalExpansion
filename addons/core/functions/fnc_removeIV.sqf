#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Removes IV from specified body part.
 * 
 *  Arguments:
 *  0: Medic <OBJECT>
 *  1: Patient <OBJECT>
 *  2: Body Part <STRING>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player, player, "rightarm"] call KJW_MedicalExpansion_Core_fnc_removeIV
 * 
 *  Public: No
 */


params ["_medic", "_patient", "_bodyPart"];

private _bodyPartIndex = BODYPARTS find toLower _bodyPart;
private _IVs = _patient getVariable [QGVAR(IV),[0,0,0,0,0,0]];
_IVs set [_bodyPartIndex, 0];
_patient setVariable [QGVAR(IV), _IVs, true];

[_patient, "activity", "%1 removed an %2", [[_medic] call ACE_common_fnc_getName, "IV"]] call ACE_Medical_Treatment_fnc_addToLog;

private _bloodBags = _patient getVariable ["ace_medical_ivBags", []];
private _newBloodBags = [];
{
    _x params ["_bagVolumeRemaining", "_type", "_bodyPartForLoop", "_bloodData"];
    if (_bodyPartIndex == _bodyPartForLoop) then {continue};
    _newBloodBags pushBack _x;
} forEach _bloodBags;
_patient setVariable ["ace_medical_ivBags",_newBloodBags,true];