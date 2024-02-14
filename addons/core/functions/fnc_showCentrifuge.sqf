#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Displays blood bag sticker according to blood data. Major thanks to Sa-matra for helping.
 * 
 *  Arguments:
 *  0: BloodItem <STRING> || 0: Unit <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player] call KJW_MedicalExpansion_Core_fnc_showCentrifuge
 * 
 *  Public: No
 */

disableSerialization;

params ["_bloodKey"];

if (typeName _bloodKey isEqualTo "OBJECT") then {
    private _fluidUsed = _bloodKey getVariable [QGVAR(selectedFluid), ""];
    _bloodKey = _fluidUsed;
};

if (_bloodKey isEqualTo "") exitWith {};

private _emptyDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
private _bg = _emptyDisplay ctrlCreate ["RscPicture",-1];
private _lb = _emptyDisplay ctrlCreate ["ctrlListbox", -1];

_bg ctrlSetPosition [0.75, 0, 0.5, 1.2];
_bg ctrlSetTextColor [0.9,0.9,0.9,1];
_bg ctrlSetText QPATHTOF(data\centrifuge\ui\gui_ca.paa);
_bg ctrlCommit 0;
_lb ctrlSetPosition [0.815, 0.23, 0.37, 0.44];

private _info = GVAR(fluidData) get _bloodKey;

{
    if (_x == "owner") then {
        continue
    };
	_lb lbAdd "";
    private _str = GET_TEXT(configFile >> "KJW_MedicalExpansion" >> "bloodProperties" >> _x >> "displayName", _x);
	_lb lbSetText [_forEachIndex, _str];
    if (_x == "bloodType") then {
        private _type = ["O+","O-","A+","A-","B+","B-","AB+","AB-"] select _y;
        _lb lbSetTextRight [_forEachIndex, _type];
        continue
    };
    if (typeName _y == "SCALAR") then {
	    _lb lbSetTextRight [_forEachIndex, str round (_y/24*100) + "% "];
    };
} forEach _info#1;
_lb ctrlCommit 0;