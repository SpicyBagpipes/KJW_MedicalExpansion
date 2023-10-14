#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Applies IV to the given limb.
 * 
 *  Arguments:
 *  0: Medic <OBJECT>
 *  1: Patient <OBJECT>
 *  2: Body Part <STRING>
 *  3: Treatment <STRING> <UNUSED>
 *  4: User <OBJECT> <UNUSED>
 *  5: Used Item <STRING>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player, player, "rightarm", "KJW_MedicalExpansion_IV"] call KJW_MedicalExpansion_Core_fnc_addIV
 * 
 *  Public: No
 */


params ["_medic", "_patient", "_bodyPart", "_treatment", "_user", "_usedItem"];

private _bodyPartIndex = BODYPARTS find toLower _bodyPart;
private _IVs = _patient getVariable [QGVAR(IV),[0,0,0,0,0,0]];
private _IVNum = _IVs#_bodyPartIndex;

private _IVType = getNumber (configFile >> "CfgWeapons" >> _usedItem >> "KJW_MedicalExpansion_IVType");
_IVs set [_bodyPartIndex, _IVType];
_patient setVariable [QGVAR(IV), _IVs, true];
[_patient, "activity", "%1 established an %2", [[_medic] call ACE_Common_fnc_getName, "IV"]] call ACE_Medical_Treatment_fnc_addToLog;
[QGVAR(ivAdded), [_usedItem, _bodyPartIndex], _patient] call CBA_fnc_targetEvent;