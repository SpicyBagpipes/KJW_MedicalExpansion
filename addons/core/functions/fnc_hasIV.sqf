#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Checks if unit has IV in specified body part. Returns number in preparation for IV types
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 *  1: Body part <STRING>
 * 
 *  Return Value:
 *  0: Has IV <NUMBER>
 * 
 *  Example:
 *  [player, "rightarm"] call KJW_MedicalExpansion_Core_fnc_hasIV
 * 
 *  Public: No
 */


params ["_unit", "_bodyPart"];

private _bodyPartIndex = BODYPARTS find toLower _bodyPart;
private _IVs = _unit getVariable [QGVAR(IV),[0,0,0,0,0,0]];
private _partCathetered = _IVs#_bodyPartIndex;

_partCathetered