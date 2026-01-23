#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Switches on the centrifuge.
 * 
 *  Arguments:
 *  0: Centrifuge <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [cursorObject] call KJW_MedicalExpansion_Core_fnc_switchOnCentrifuge
 * 
 *  Public: No
 */

params ["_target"];

private _time = time;
_target setVariable [QGVAR(spinInProgress), true, true];
_target setVariable [QGVAR(spinComplete), false, true];
_target setVariable [QGVAR(spinStartedTime), _time, true];

private _configDuration = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(centrifugeDuration));
private _duration = GVAR(centrifugeCoef)*_configDuration;

_target animateSource ["lid_source", 0];

[{
	params ["_target", "_timeStarted"];

	if (isNull _target || !alive _target) exitWith {};

	private _lastTimeStarted = _target getVariable [QGVAR(spinStartedTime), 0];
	
	if (_timeStarted < _lastTimeStarted) exitWith {};

	_target animateSource ["lid_source", 1];

	_target setVariable [QGVAR(spinComplete), true, true];
	_target setVariable [QGVAR(spinInProgress), false, true];
}, [_target, _time], _duration] call CBA_fnc_waitAndExecute;
