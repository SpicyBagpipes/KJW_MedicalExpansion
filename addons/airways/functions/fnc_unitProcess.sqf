#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Function description
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 *  1: Time delta <NUMBER>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [bob, 1] call KJW_MedicalExpansion_Airways_fnc_unitProcess
 * 
 *  Public: No
 */

params ["_unit","_deltaT"];

// Check unit's airways. Are they clear?
private _breathingEffectiveness = 1;
private _headInjuries = [_unit, "head"] call ace_medical_fnc_getOpenWounds;
{
    _x params ["_id","_openness","_bleedingCoef","_dmg"];
    private _classname = ace_medical_damage_woundClassNames select _id/10;
    if (toLower _classname in GVAR(airwayInjuries)) then {
        // Uh oh, he's got a head injury!
        _breathingEffectiveness = _breathingEffectiveness - _dmg;
    };
} forEach _headInjuries;

// Check unit's chest. What's the state of it?
private _chestInjuries = [_unit, "body"] call ace_medical_fnc_getOpenWounds;
{
    _x params ["_id","_openness","_bleedingCoef","_dmg"];
    private _classname = ace_medical_damage_woundClassNames select _id/10;
    if (toLower _classname in GVAR(lungInjuries)) then {
        // Uh oh, he's got a lung injury!
        _breathingEffectiveness = _breathingEffectiveness - _dmg;
    };
} forEach _chestInjuries;

_breathingEffectiveness = _breathingEffectiveness;
private _previousEffectiveness = _unit getVariable ["ace_medical_vitals_breathingEffectiveness",1];
private _syncValue = _previousEffectiveness isNotEqualTo _breathingEffectiveness;

_unit setVariable ["ace_medical_vitals_breathingEffectiveness",_breathingEffectiveness,_syncValue]; // Requires https://github.com/acemod/ACE3/pull/11209
