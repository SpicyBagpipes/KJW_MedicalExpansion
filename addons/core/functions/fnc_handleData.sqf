#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Handles new data for fluids.
 * 
 *  Arguments:
 *  0: Data <ARRAY>
 *  1: Addition <STRING>
 * 
 *  Return Value:
 *  0: New ID <STRING>
 * 
 *  Example:
 *  [_data, "add"] call KJW_MedicalExpansion_Core_fnc_handleData
 * 
 *  Public: No
 */


params ["_data", "_addition"];

//Example _data array: [classname,[bloodinfo (hashmap)]]
//Bloodinfo should probably be hashmap.

private _fluidData = GVAR(fluidData);
private _classname = _data#0;
if (count _fluidData isEqualTo 0 && _addition == "add") exitWith {
	//Does not exist, create.
	private _newKey = _classname + "_1";
	GVAR(fluidData) set [_newKey, _data];
	_newKey
};
switch _addition do {
	case "add": {
		private _classname_ = _classname + "_";
		{
			private _key = _x;

			private _hasKeyed = if (_classname in _key) then {
				//This is not 1.
				private _id = _key regexReplace [_classname_, ""];
				_id = parseNumber _id;
				private _newId = _id+1;
				_newId = str _newId;
				private _newKey = _classname_+_newId;
				if (_newKey in GVAR(fluidData)) then {
					//Exists, skip iteration.
					continue
				};
				GVAR(fluidData) set [_newKey, _data];
				_newKey
			} else {
				//this is 1. overwrite 1.
				private _newKey = _classname + "_1";
				GVAR(fluidData) set [_newKey, _data];
				_newKey
			};
			if (!isNil "_hasKeyed") exitWith {_hasKeyed};
		} forEach _fluidData;
	};
	case "remove": {
		//Remove from _data
		_fluidData deleteAt _classname;
	};
};