#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Function used for giving unit the relevant fluid item.
 * 
 *  Arguments:
 *  0: ID <STRING>
 *  1: Recipient <UNIT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  ["KJW_MedicalExpansion_bloodBag_1000_1", player] call KJW_MedicalExpansion_Core_fnc_convertToItem
 * 
 *  Public: No
 */


params["_key", "_unit"];

private _info = GVAR(fluidData) get _key;
_info params ["_baseClass", "_bloodData"];
_unit removeItem _baseClass;
_unit addItem _key;