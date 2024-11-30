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
    if (_x == "medications") then {
        {
            _x params ["_medicationName", "_dose"];

            private _showInCentrifuge = GET_NUMBER(configFile >> "KJW_MedicalExpansion" >> "centrifugeMedications" >> _medicationName >> "showInCentrifuge", 0);
            if (_showInCentrifuge != 1) then {continue};

            _lb lbAdd "";
            private _str = GET_TEXT(configFile >> "KJW_MedicalExpansion" >> "centrifugeMedications" >> _medicationName >> "displayName", _medicationName);
            private _doseMultiplier = GET_NUMBER(configFile >> "KJW_MedicalExpansion" >> "centrifugeMedications" >> _medicationName >> "doseMultiplier", 1);
            private _doseMeasurement = GET_TEXT(configFile >> "KJW_MedicalExpansion" >> "centrifugeMedications" >> _medicationName >> "doseMeasurement", "mg");
            _lb lbSetText [lbSize _lb - 1, _str];
            _lb lbSetTextRight [lbSize _lb - 1, (str (_dose*_doseMultiplier)) + " " + _doseMeasurement + " "];
        } forEach _y;
        continue;
    }; // Medications have specific handling
	_lb lbAdd "";
    private _str = GET_TEXT(configFile >> "KJW_MedicalExpansion" >> "bloodProperties" >> _x >> "displayName", _x);
	_lb lbSetText [lbSize _lb - 1, _str];
    _lb lbSetTextRight [lbSize _lb - 1, "0% "];
    if (_x == "bloodType") then {
        private _type = ["O+","O-","A+","A-","B+","B-","AB+","AB-"] select _y;
        _lb lbSetTextRight [lbSize _lb - 1, _type];
        continue
    };
    if (typeName _y == "SCALAR") then {
	    _lb lbSetTextRight [lbSize _lb - 1, str round (_y/24*100) + "% "];
    };
} forEach _info#1;

lbSort _lb;
_lb ctrlCommit 0;