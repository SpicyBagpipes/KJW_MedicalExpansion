#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Create a new action per blood sample bottle
 * 
 *  Arguments:
 *  0: Target <ARRAY>
 *  1: Unit <BOOL>
 * 
 *  Return Value:
 *  0: Children Actions <ARRAY>
 * 
 *  Example:
 *  [cursorObject, player] call KJW_MedicalExpansion_Core_fnc_addCentrifugeLoadActions
 * 
 *  Public: No
 */

params ["_target", "_unit"];

private _actions = [];
private _items = items _unit select {_x isKindOf ["KJW_MedicalExpansion_bloodSample", configFile >> "CfgWeapons"]};

{
	private _sampleNumber = _x regexReplace ["KJW_MedicalExpansion_bloodSample_",""];
	private _childStatement = {
		params ["_target", "_unit", "_params"];
		_params params ["_item"];
		_unit removeItem _item;
		private _currentLoaded = _target getVariable [QGVAR(currentLoaded), []];
		_currentLoaded pushBack _item;
		_target setVariable [QGVAR(currentLoaded), _currentLoaded, true];
	};
	private _condition = {
		params ["_target", "_unit", "_params"];
		private _spinComplete = _target getVariable [QGVAR(spinComplete), false];
		!_spinComplete
	};
	private _action = [format ["item:%1",_x], format ["Load Sample %1", _sampleNumber], "\y\KJW_MedicalExpansion\addons\core\data\vial512full.paa", _childStatement, _condition, {}, _x,"",4,[false, false, false, false, false]] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], _target];
} forEach _items;

_actions
