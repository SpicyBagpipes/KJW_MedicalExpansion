#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Processes PPE value for the unit. Return value is format [_headgear, _facewear, _backpack, _uniform]
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 * 
 *  Return Value:
 *  0: PPE <ARRAY>
 * 
 *  Example:
 *  [player] call KJW_MedicalExpansion_PPE_fnc_processPPE
 * 
 *  Public: No
 */

params ["_unit"];

private _headgear = headgear _unit;
private _facewear = goggles _unit;
private _backpack = backpack _unit;
private _uniform = uniform _unit;

private _allItems = [_headgear, _facewear, _backpack, _uniform] + itemsWithMagazines _unit;

private _headgearRating = getNumber (configFile >> "CfgWeapons" >> _headgear >> QGVAR(rating));
private _facewearRating = getNumber (configFile >> "CfgGlasses" >> _facewear >> QGVAR(rating));
private _backpackRating = getNumber (configFile >> "CfgVehicles" >> _backpack >> QGVAR(rating));
private _uniformRating = getNumber (configFile >> "CfgWeapons" >> _uniform >> QGVAR(rating));

private _headgearRequirements = getArray (configFile >> "CfgWeapons" >> _headgear >> QGVAR(requirements));
private _facewearRequirements = getArray (configFile >> "CfgGlasses" >> _facewear >> QGVAR(requirements));
private _backpackRequirements = getArray (configFile >> "CfgVehicles" >> _backpack >> QGVAR(requirements));
private _uniformRequirements = getArray (configFile >> "CfgWeapons" >> _uniform >> QGVAR(requirements));

private _totalArr = [
	[_headgearRating,_headgearRequirements],
	[_facewearRating,_facewearRequirements],
	[_backpackRating,_backpackRequirements],
	[ _uniformRating, _uniformRequirements]
];

private _outputArr = [];

{
	_x params ["_rating", "_requirements"];

	if (isNil "_rating") then {
		_rating = 0;
	};
	
	if (isNil "_requirements") then {
		_outputArr pushBack _rating*EGVAR(core,ppeCoef);
		continue;
	};
	
	if (_requirements isEqualTo []) then {
		_outputArr pushBack _rating*EGVAR(core,ppeCoef);
		continue;
	};
	
	if (count (_requirements arrayIntersect _allItems) > 0) then {
		_outputArr pushBack _rating*EGVAR(core,ppeCoef);
		continue;
	};

	_outputArr pushBack 0;
} forEach _totalArr;

_outputArr