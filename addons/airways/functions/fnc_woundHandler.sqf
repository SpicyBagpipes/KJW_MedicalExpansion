#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Wound handler for airways
 * 
 *  Arguments:
 *  
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_Airways_fnc_woundHandler
 * 
 *  Public: No
 */

params ["_unit", "_allDamages", "_typeOfDamage"];

if (random 100 > GVAR(lungSizeCoef)) exitWith {_this}; // Didn't hit the lungs

{
    _x params ["_dmgAfter","_sel","_dmgBefore"];
    if (_dmgBefore <= 0 || _dmgAfter <= 0 || _sel != "Body") then {continue};
    if (_dmgBefore/_dmgAfter <= GVAR(overpenCoef)) then { 
        // Probably overpenned, add another penetrating injury here
    };
} forEach _allDamages;

_this
