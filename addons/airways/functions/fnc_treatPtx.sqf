#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Local handling of ptx treatment
 * 
 *  Arguments:
 *  0: Patient <OBJECT>
 *  1: Body Part <STRING>
 *  2: Treatment <STRING>
 *  3: Bandage Effectiveness <NUMBER>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player, "Body", "KJW_MedicalExpansion_ChestDrain", 1] call KJW_MedicalExpansion_Airways_fnc_treatPtx
 * 
 *  Public: No
 */

params ["_patient", "_bodyPart", "_classname", "_bandageEffectiveness"];

private _openWounds = _patient getVariable ["ace_medical_openWounds",createHashMap];
private _woundsOnPart = _openWounds get _bodyPart;

private _treatedDamage = 0;
private _clearConditionCache = false;

{
    private _wound = _x;
    _wound params ["_classID", "_amountOf", "_bleeding", "_damage"];

    private _effectiveness = 1;
    private _impact = 1;
    private _var = GVAR(ncdInjuries);

    if (_classname isKindOf ["KJW_MedicalExpansion_ChestDrain", configFile >> "CfgWeapons"]) then {
        _var = GVAR(chestDrainInjuries);
    } else {
        private _varToCheck = getText (configFile >> "CfgWeapons" >> _classname >> QGVAR(woundTreatmentList));
        private _treatableWounds = missionNamespace getVariable _varToCheck;
        if !(isNil "_treatableWounds") then {
            _var = _treatableWounds;
        };
    };

    private _classname = ace_medical_damage_woundClassNames select _classID/10;
    if !(_classname in _var) then {
        continue
    };

    // clear condition cache if we stopped all bleeding for this injury
    if (!_clearConditionCache) then {
        _clearConditionCache = (_effectiveness >= _amountOf);
    };

    // Reduce the amount this injury is present
    (_woundsOnPart select _forEachIndex) set [1, _amountOf - _impact];

    // Store treated damage for clearing trauma
    _treatedDamage = _treatedDamage + (_impact * _damage);
} forEach _woundsOnPart;

_patient setVariable ["ace_medical_openWounds",_openWounds,true];

[_patient] call ace_medical_status_fnc_updateWoundBloodLoss;

if (ace_medical_treatment_clearTrauma == 2) then {
    [_patient, _bodyPart, -_treatedDamage] call ace_medical_treatment_fnc_addTrauma;
};

if (_clearConditionCache) then {
    private _nearPlayers = (_patient nearEntities ["CAManBase", 6]) select {_x call ace_common_fnc_isPlayer};
    ["ace_interact_menu_clearConditionCaches", [], _nearPlayers] call CBA_fnc_targetEvent;
};
