#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Checks if unit can take fluid medication in body part.
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 *  1: Body Part <STRING>
 * 
 *  Return Value:
 *  0: Can take new medication <BOOL>
 * 
 *  Example:
 *  [player, "rightarm"] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication
 * 
 *  Public: No
 */


params ["_unit", "_mainBodyPart"];

private _bloodBags = _unit getVariable ["ace_medical_ivbags", []];
private _IVs = _unit getVariable [QGVAR(IV), [0, 0, 0, 0, 0, 0]];
private _mainBodyPartIndex = BODYPARTS find toLower _mainBodyPart;
private _ivBagAmount = count (_bloodBags select {
  _x params ["_bagVolumeRemaining", "_type", "_bodyPartIndex", "_bloodData"];
  if (_bodyPartIndex == _mainBodyPartIndex) then {continueWith true};
  false
});
private _IVQuantity = getNumber (configFile >> "KJW_MedicalExpansion" >> "IVs" >> str (_IVs#_mainBodyPartIndex) >> "handlingAmount");

_ivBagAmount < _IVQuantity