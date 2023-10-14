#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Checks if centrifuge can be switched on.
 * 
 *  Arguments:
 *  0: Centrifuge <OBJECT>
 * 
 *  Return Value:
 *  0: Can Switch On <BOOL>
 * 
 *  Example:
 *  [cursorObject] call KJW_MedicalExpansion_Core_fnc_canSwitchOnCentrifuge
 * 
 *  Public: No
 */

params ["_target"];

private _spinInProgress = _target getVariable [QGVAR(spinInProgress),false];
private _currentLoaded = _target getVariable [QGVAR(currentLoaded), []];
private _spinComplete = _target getVariable [QGVAR(spinComplete), false];

!_spinInProgress && (count _currentLoaded > 0) && !_spinComplete