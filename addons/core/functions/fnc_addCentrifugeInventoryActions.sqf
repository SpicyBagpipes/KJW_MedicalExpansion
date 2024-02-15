#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Create a new action per blood sample bottle in centrifuge inventory
 * 
 *  Arguments:
 *  0: Centrifuge <TARGET>
 * 
 *  Return Value:
 *  0: Children Actions <ARRAY>
 * 
 *  Example:
 *  [cursorObject] call KJW_MedicalExpansion_Core_fnc_addCentrifugeInventoryActions
 * 
 *  Public: No
 */

params ["_target"];

private _actions = [];
private _currentLoaded = _target getVariable [QGVAR(currentLoaded), []];

{
	private _childStatement = { // Runs on hover.
		params ["_target", "_unit", "_params"];
		_params params ["_item"];
		private _spinComplete = _target getVariable [QGVAR(spinComplete), false];
		if (_spinComplete) then {
			// Remove item with destruction.
			private _currentLoaded = _target getVariable [QGVAR(currentLoaded), []];
			_currentLoaded deleteAt (_currentLoaded find _item);
			_target setVariable [QGVAR(currentLoaded), _currentLoaded, true];

			// Display results.
			[_item] call KJW_MedicalExpansion_Core_fnc_showCentrifuge;

			if (_currentLoaded isEqualTo []) then {
				_target setVariable [QGVAR(spinComplete), false, true];
			};
		} else {
			// Unload.
			private _currentLoaded = _target getVariable [QGVAR(currentLoaded), []];
			_currentLoaded deleteAt (_currentLoaded find _item);
			_target setVariable [QGVAR(currentLoaded), _currentLoaded, true];
			[_unit, _item] call CBA_fnc_addItem;
		};
	};
	private _modifierFunc = {
		params ["_target", "_player", "_params", "_actionData"];
		_params params ["_item"];
    	// Modify the action - index 1 is the display name, 2 is the icon...
		private _spinComplete = _target getVariable [QGVAR(spinComplete), false];
		if (_spinComplete) then {
			// Display results.
			_actionData set [1, format ["Inspect Sample %1 Results", _item regexReplace ["KJW_MedicalExpansion_bloodSample_",""]]];
		} else {
			// Unload.
			_actionData set [1, format ["Unload Sample %1", _item regexReplace ["KJW_MedicalExpansion_bloodSample_",""]]];
		};
	};
	private _action = [format ["item:%1",_x], format ["Sample %1", _forEachIndex], "\y\KJW_MedicalExpansion\addons\core\data\vial512full.paa", _childStatement, {true}, {}, _x,"",4,[false, false, false, false, false],_modifierFunc] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], _target];
} forEach _currentLoaded;

_actions