#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Function used for giving player the relevant fluid item.
 * 
 *  Arguments:
 *  0: ID <STRING>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  ["KJW_MedicalExpansion_bloodBag_1000_1"] call KJW_MedicalExpansion_Core_fnc_convertToItem
 * 
 *  Public: No
 */


params["_key"];

private _info = GVAR(fluidData) get _key;
_info params ["_baseClass", "_bloodData"];
player removeItem _baseClass;
player addItem _key;