#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Switches off the centrifuge.
 * 
 *  Arguments:
 *  0: Centrifuge <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [cursorObject] call KJW_MedicalExpansion_Core_fnc_switchOffCentrifuge
 * 
 *  Public: No
 */

params ["_target"];

_target setVariable [QGVAR(spinInProgress), false, true];
_target setVariable [QGVAR(spinStartedTime), 0, true];
_target setVariable [QGVAR(currentLoaded), [], true];
_target setVariable [QGVAR(spinComplete), false, true];
_target animateSource ["lid_source", 1];