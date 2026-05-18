#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Runs on updatevitals
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [bob] call KJW_MedicalExpansion_Airways_fnc_updateVitals
 * 
 *  Public: No
 */

params ["_unit"];

private _currentOpenWounds = (_unit getVariable ["ace_medical_openWounds",createHashMap]) get "body";

private _openChestWounds = nil;
private _classname = nil;
private _hasPtx = false;

// Handle removal of PTX if no penetrating chest wounds
{
    _x params ["_id","_openness","_bleedingCoef","_dmg"];
    _classname = ace_medical_damage_woundClassNames select _id/10;
    if (_classname in GVAR(normalPtx)) then {
        // Uh oh, he's got a pneumothorax!
        _hasPtx = true;
    } else {
        if (_classname in GVAR(lungInjuries)) then {
            _openChestWounds = _x;
            //break;
        } else {
            _classname = nil;
        };
    };
} forEach _currentOpenWounds;

if ((isNil "_openChestWounds") && _hasPtx) then {
    // Heal hims chest
    if (random 1 < 0.5) then {
        //systemChat "yeah i'd heal";
        // Heal PTX
        // TODO: this
        [_unit, "Body", "KJW_MedicalExpansion_ChestSeal"] call ace_medical_treatment_fnc_bandageLocal
    };
};
