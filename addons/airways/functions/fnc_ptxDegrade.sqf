#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Handles degrading of a pneumothorax
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 *  1: Open wounds <HASHMAP>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [_unit, _unit getVariable "ace_medical_openWounds"] call KJW_MedicalExpansion_Airways_fnc_ptxDegrade
 * 
 *  Public: No
 */

params ["_unit","_oldOpenWounds"];

//if (!alive _unit) exitWith {}; // Should cover unit being deleted/cleaned up

private _currentOpenWounds = (_unit getVariable ["ace_medical_openWounds",createHashMap]) get "body";
private _currentBandagedWounds = (_unit getVariable ["ace_medical_bandagedWounds",createHashMap]) get "body";
private _currentStitchedWounds = (_unit getVariable ["ace_medical_stitchedWounds",createHashMap]) get "body";

private _openChestWounds = nil;
private _bandagedChestWounds = nil;
private _stitchedChestWounds = nil;
private _oldChestWounds = nil;

{
    _x params ["_id","_openness","_bleedingCoef","_dmg"];
    private _classname = ace_medical_damage_woundClassNames select _id/10;
    if (_classname in GVAR(lungInjuries)) then {
        // Uh oh, he's got an open lung injury!
        _openChestWounds = _x;
    };
} forEach _currentOpenWounds;

{
    _x params ["_id","_openness","_bleedingCoef","_dmg"];
    private _classname = ace_medical_damage_woundClassNames select _id/10;
    if (_classname in GVAR(lungInjuries)) then {
        // Uh oh, he's got an bandaged lung injury!
        _bandagedChestWounds = _x;
    };
} forEach _currentBandagedWounds;

{
    _x params ["_id","_openness","_bleedingCoef","_dmg"];
    private _classname = ace_medical_damage_woundClassNames select _id/10;
    if (_classname in GVAR(lungInjuries)) then {
        // Uh oh, he's got an bandaged lung injury!
        _stitchedChestWounds = _x;
    };
} forEach _currentStitchedWounds;

{
    _x params ["_id","_openness","_bleedingCoef","_dmg"];
    private _classname = ace_medical_damage_woundClassNames select _id/10;
    if (_classname in GVAR(lungInjuries)) then {
        // Uh oh, he had an open lung injury!
        _oldChestWounds = _x;
    };
} forEach (_oldOpenWounds get "body");

if isNil "_bandagedChestWounds" then {_bandagedChestWounds = [nil,0]};
if isNil "_openChestWounds" then {_openChestWounds = [nil,0]};

if ((_openChestWounds#1 + _bandagedChestWounds#1) isEqualTo 0) exitWith {}; // No more untreated chest wounds

if (/*(_openChestWounds#1 + _bandagedChestWounds#1) <= _oldChestWounds#1*/false) then { // There is either fewer chest wounds or same number
    // Give a single pneumothorax
    [_unit, 0.6, "body", QGVAR(pneumothoraxDmg)] call ace_medical_fnc_addDamageToUnit;
} else { // There is more chest wounds
    // Give a single hemopneumothorax
    [_unit, 0.6, "body", QGVAR(hemopneumothoraxDmg)] call ace_medical_fnc_addDamageToUnit;
};
