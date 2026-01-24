#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Condition for Chest Drain application
 * 
 *  Arguments:
 *  0: Medic <OBJECT>
 *  1: Patient <OBJECT>
 *  2: Selection <STRING>
 *  3: Classname <STRING>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [ace_player, bob, "Body", "KJW_MedicalExpansion_ChestDrain"] call KJW_MedicalExpansion_Airways_fnc_canChestDrain
 * 
 *  Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname"];

private _hasInjury = false;

private _chestInjuries = [_patient, "body"] call ace_medical_fnc_getOpenWounds;
{
    _x params ["_id","_openness","_bleedingCoef","_dmg"];
    private _classname = ace_medical_damage_woundClassNames select _id/10;
    if (_classname in GVAR(chestDrainInjuries)) then {
        // Uh oh, he's got a lung injury!
        _hasInjury = true;
    };
} forEach _chestInjuries;

_hasInjury
