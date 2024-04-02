#include "script_component.hpp"
/*
 * Author: Glowbal
 * Editor: KJW
 * Calculates the blood volume change and decreases the IVs given to the unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Time since last update <NUMBER>
 * 2: Global Sync Values (bloodbags) <BOOL>
 *
 * Return Value:
 * Blood volume change (liters per second) <NUMBER>
 *
 * Example:
 * [player, 1, true] call ace_medical_status_fnc_getBloodVolumeChange
 *
 * Public: No
 */

params ["_unit", "_deltaT", "_syncValues"];

private _bloodLoss = [_unit] call ace_medical_status_fnc_getBloodLoss;
private _internalBleeding = GET_INTERNAL_BLEEDING(_unit);
private _bloodVolumeChange = -_deltaT * (_bloodLoss + _internalBleeding);
private _unitData = _unit getVariable ["KJW_MedicalExpansion_Core_BloodInfo", createHashmap]; // EDIT HERE.

if (!isNil {_unit getVariable [QACEGVAR(medical,ivBags),[]]}) then {
    private _bloodBags = _unit getVariable [QACEGVAR(medical,ivBags), []];
    private _tourniquets = GET_TOURNIQUETS(_unit);
    private _IVarray = _unit getVariable [QGVAR(IV), [0,0,0,0,0,0]];
    private _flowCalculation = ACEGVAR(medical,ivFlowRate) * (_unit getVariable [QGVAR(alphaAction), 1]) * _deltaT * 4.16;

    if (GET_HEART_RATE(_unit) < 20) then {
        _flowCalculation = _flowCalculation / 1.5;
    };

    _bloodBags = _bloodBags apply {
        _x params ["_bagVolumeRemaining", "_type", "_bodyPart", "_bloodData"]; // EDIT HERE.

        private _bloodDataHash = _bloodData#1; // EDIT HERE.

        if ((_tourniquets select _bodyPart isEqualTo 0) && (_IVarray select _bodyPart isNotEqualTo 3)) then {
            private _bagChange = _flowCalculation min _bagVolumeRemaining; // absolute value of the change in miliLiters
            _bagVolumeRemaining = _bagVolumeRemaining - _bagChange;
            private _bloodType = _bloodDataHash get "bloodType"; // EDIT HERE.
            private _isCompatible = [_unit getVariable "KJW_MedicalExpansion_Core_bloodType",_bloodType] call KJW_MedicalExpansion_Core_fnc_checkBloodTypeCompatibility; // EDIT HERE.
            if (!_isCompatible && KJW_MedicalExpansion_Core_bloodIncompatibilityEnabled) then { // EDIT HERE.
                _bagChange = _bagChange * -1; // EDIT HERE.
                private _roll = random 1; // EDIT HERE.
                if (_roll < 0.2) then { // EDIT HERE.
                    private _bodyPart = selectRandom ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]; // EDIT HERE.
                    [_unit, 0.025, _bodyPart, "KJW_Bruise"] call ace_medical_fnc_addDamageToUnit; // EDIT HERE.
                }; // EDIT HERE.
            }; // EDIT HERE.
            _bloodVolumeChange = _bloodVolumeChange + (_bagChange / 1000);

            /////////////////////////////////////////// Begin edits.
            _unitData = if (_unitData isEqualTo []) then {createHashmapFromArray _unitData} else {_unitData};
			{
				private _data = _bloodDataHash getOrDefault [_x, 0, true];
				private _dataChange = (_deltaT * ACEGVAR(medical,ivFlowRate) * 0.016667) min _data; // EDIT HERE (ACEGVAR from EGVAR)
				private _dataRemaining = _data - _dataChange;
				_bloodDataHash set [_x, _dataRemaining];
				private _value = _unitData getOrDefault [_x, 0, true];
				_value = _value + _dataChange;
				_unitData set [_x, _value];
			} forEach KJW_MedicalExpansion_Core_BloodTransmissiveInfo;
        };

        if (_bagVolumeRemaining < 0.01) then {
            []
        } else {
            [_bagVolumeRemaining, _type, _bodyPart]
        };

        if (_bagVolumeRemaining < 0.01) then {
            ["KJW_MedicalExpansion_Core_dataRemove", [_bloodData]] call CBA_fnc_globalEvent; // Check if this is a default one or not.
            []
        } else {
            [_bagVolumeRemaining, _type, _bodyPart, [_bloodData#0, _bloodDataHash]]
        };
    };

    _bloodBags = _bloodBags - [[]]; // remove empty bags

    if (_bloodBags isEqualTo []) then {
        _unit setVariable [QACEGVAR(medical,ivBags), nil, true]; // no bags left - clear variable (always globaly sync this)
    } else {
        _unit setVariable [QACEGVAR(medical,ivBags), _bloodBags, _syncValues];
    };
};

{
    private _reduction = _bloodVolumeChange*4; //Negative value.
    private _currentVar = _unitData get _x;
    _unitData set [_x, _currentVar+_reduction];
} forEach KJW_MedicalExpansion_Core_BloodTransmissiveInfo;

/////////////////////////////////////////////// End edits.

_bloodVolumeChange