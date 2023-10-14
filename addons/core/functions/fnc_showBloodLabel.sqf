#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Displays blood bag sticker according to blood data.
 * 
 *  Arguments:
 *  0: BloodItem <STRING> || 0: Unit <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player] call KJW_MedicalExpansion_Core_fnc_showBloodLabel
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

("KJW_MedicalExpansion_Core_bagSticker" call BIS_fnc_rscLayer) cutRsc ["KJW_MedicalExpansion_Core_bagSticker", "PLAIN", 1, true];

private _display = uiNamespace getVariable ["KJW_MedicalExpansion_Core_bagSticker", displayNull];
if (isNull _display) exitWith {};

private _data = GVAR(fluidData) get _bloodKey;
if (isNil "_data") exitWith {systemChat "Could not find blood information."};
private _type = _data#1 getOrDefault ["bloodType", -1];
private _displayType = ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-", "<NULL>"] select _type;
private _volume = switch (true) do {
	case ("_250_" in _bloodKey): {"250"};
	case ("_500_" in _bloodKey): {"500"};
	case ("_1000_" in _bloodKey): {"1000"};
	default {"Sample"};
};
private _count = count _displayType;

private _ctrlVolume = _display displayCtrl 2121;
private _ctrlType = _display displayCtrl 2122;
private _ctrlRH = _display displayCtrl 2123;

_ctrlVolume ctrlSetText _volume;

if (_count isEqualTo 2) then {
	_ctrlType ctrlSetText (_displayType select [0, 1]);
	_ctrlRH ctrlSetText (_displayType select [1, 1]);
} else {
	_ctrlType ctrlSetText (_displayType select [0, 2]);
	_ctrlRH ctrlSetText (_displayType select [2, 1]);
};