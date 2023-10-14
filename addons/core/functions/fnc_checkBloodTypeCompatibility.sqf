#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Checks compatibility between blood types.
 *  Source: https://stanfordbloodcenter.org/wp-content/uploads/2018/03/0318-SouthBay-Center-Infographics_Compatibility-WEB.jpg
 * 
 *  Arguments:
 *  0: Recipient Type <NUMBER>
 *  1: Donor Type <NUMBER>
 * 
 *  Return Value:
 *  0: Compatible <BOOL>
 * 
 *  Example:
 *  [1,3] call KJW_MedicalExpansion_Core_fnc_checkBloodTypeCompatibility
 * 
 *  Public: Yes
 */


params ["_recipientType", "_donorType"];

private _info = [_recipientType, _donorType] apply {[_x] call FUNC(getBloodTypeInfo)};
_info params ["_recipientInfo", "_donorInfo"];

private _typesCompatible = 
{
	if (_donorInfo#_forEachIndex && {!(_recipientInfo#_forEachIndex)}) exitWith {false};
	true
} forEach _recipientInfo;

_typesCompatible