#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Checks if centrifuge can be switched off.
 * 
 *  Arguments:
 *  0: Centrifuge <OBJECT>
 * 
 *  Return Value:
 *  0: Can Switch Off <BOOL>
 * 
 *  Example:
 *  [cursorObject] call KJW_MedicalExpansion_Core_fnc_canSwitchOffCentrifuge
 * 
 *  Public: No
 */

params ["_target"];

private _spinInProgress = _target getVariable [QGVAR(spinInProgress),false];

_spinInProgress
