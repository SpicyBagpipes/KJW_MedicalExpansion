#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Returns amount of protection vest has.
 * 
 *  Arguments:
 *  0: Player <OBJECT>
 * 
 *  Return Value:
 *  0: Protection <NUMBER>
 * 
 *  Example:
 *  [player] call KJW_MedicalExpansion_Core_fnc_getVestProtection
 * 
 *  Public: No
 */


params ["_unit"];

private _vest = vest _unit;
private _protection = getNumber (configFile >> "CfgWeapons" >> _vest >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor");
_protection
