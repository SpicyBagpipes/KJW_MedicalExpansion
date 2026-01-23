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

private _headgearRating = GET_NUMBER((configFile >> "CfgWeapons" >> _headgear >> QGVAR(rating)),GVAR(PPE) get _headgear);
private _facewearRating = GET_NUMBER((configFile >> "CfgGlasses" >> _facewear >> QGVAR(rating)),GVAR(PPE) get _facewear);
private _backpackRating = GET_NUMBER((configFile >> "CfgVehicles" >> _backpack >> QGVAR(rating)),GVAR(PPE) get _backpack);
private _uniformRating = GET_NUMBER((configFile >> "CfgWeapons" >> _uniform >> QGVAR(rating)),GVAR(PPE) get _uniform);

private _headgearRequirements = GET_ARRAY((configFile >> "CfgWeapons" >> _headgear >> QGVAR(requirements)),GVAR(PPERequirements) get _headgear);
private _facewearRequirements = GET_ARRAY((configFile >> "CfgGlasses" >> _facewear >> QGVAR(requirements)),GVAR(PPERequirements) get _facewear);
private _backpackRequirements = GET_ARRAY((configFile >> "CfgVehicles" >> _backpack >> QGVAR(requirements)),GVAR(PPERequirements) get _backpack);
private _uniformRequirements = GET_ARRAY((configFile >> "CfgWeapons" >> _uniform >> QGVAR(requirements)),GVAR(PPERequirements) get _uniform);

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
