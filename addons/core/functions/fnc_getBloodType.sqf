#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Gets blood type according to real world demographics.
 *  Source: https://www.worldatlas.com/articles/what-are-the-different-blood-types.html
 *  Note: Source may be inaccurate, however provides easy to work with values.
 *  [1, 2, 3, 4, 5, 6, 7, 8] -> [O+, O-, A+, A-, B+, B-, AB+, AB-]
 *  Take note index begins at 1 and not 0.
 * 
 *  Arguments:
 *  0: Unit <UNIT>
 * 
 *  Return Value:
 *  0: Type <NUMBER>
 * 
 *  Example:
 *  [player] call KJW_MedicalExpansion_Core_fnc_getBloodType
 * 
 *  Public: Yes
 */


params ["_unit"];

private _type = 0;
private _hasType = _unit getVariable [QGVAR(bloodType),0];
if (_hasType isNotEqualTo 0) exitWith {_hasType};
//No blood type yet assigned.
if (!isMultiplayer || !isPlayer _unit) exitWith {
	//Is singleplayer or is not a player.
	private _bloodType = [
        BLOODTYPE_OPOS,
        BLOODTYPE_ONEG,
        BLOODTYPE_APOS,
        BLOODTYPE_ANEG,
        BLOODTYPE_BPOS,
        BLOODTYPE_BNEG,
        BLOODTYPE_ABPOS,
        BLOODTYPE_ABNEG
    ] selectRandomWeighted [
        PROB_OPOS,
        PROB_ONEG,
        PROB_APOS,
        PROB_ANEG,
        PROB_BPOS,
        PROB_BNEG,
        PROB_ABPOS,
        PROB_ABNEG
    ];

    if (GVAR(KAMLoaded)) then {
        private _KAMType = [_unit] call kat_circulation_fnc_bloodType;
        private _newType = switch _KAMType do {
            case "A": {BLOODTYPE_APOS};
            case "A_N": {BLOODTYPE_ANEG};
            case "B": {BLOODTYPE_BPOS};
            case "B_N": {BLOODTYPE_BNEG};
            case "O": {BLOODTYPE_OPOS};
            case "O_N": {BLOODTYPE_ONEG};
            case "AB": {BLOODTYPE_ABPOS};
            case "AB_N": {BLOODTYPE_ABNEG};
        };
        _bloodType = _newType;
    };

	_unit setVariable [QGVAR(bloodType),_bloodType,true];
    
	_bloodType
};

//Is player and is multiplayer.

private _uid = getPlayerUID player select [11,6]; //Arma cannot handle much longer strings.
_uid = parseNumber _uid;
private _random = _uid random 1000;

_type = switch (true) do {
    case (_random <= 5): {BLOODTYPE_ABNEG};
    case (_random <= 15): {BLOODTYPE_BNEG};
    case (_random <= 40): {BLOODTYPE_ANEG};    
    case (_random <= 70): {BLOODTYPE_ONEG};
    case (_random <= 120): {BLOODTYPE_ABPOS};
    case (_random <= 270): {BLOODTYPE_BPOS};
    case (_random <= 580): {BLOODTYPE_APOS};
    default {BLOODTYPE_OPOS};
};

if (GVAR(KAMLoaded)) then {
    private _KAMType = [_unit] call kat_circulation_fnc_bloodType;
    private _newType = switch _KAMType do {
        case "A": {BLOODTYPE_APOS};
        case "A_N": {BLOODTYPE_ANEG};
        case "B": {BLOODTYPE_BPOS};
        case "B_N": {BLOODTYPE_BNEG};
        case "O": {BLOODTYPE_OPOS};
        case "O_N": {BLOODTYPE_ONEG};
        case "AB": {BLOODTYPE_ABPOS};
        case "AB_N": {BLOODTYPE_ABNEG};
    };
    _type = _newType;
};
_unit setVariable [QGVAR(bloodType),_type,true];

_type