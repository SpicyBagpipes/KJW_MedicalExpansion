#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Checks if specified player can load targeted centrifuge.
 * 
 *  Arguments:
 *  0: Target <OBJECT>
 *  1: Player <OBJECT>
 * 
 *  Return Value:
 *  0: Can Load <BOOL>
 * 
 *  Example:
 *  [_target, _player] call KJW_MedicalExpansion_Core_fnc_canLoadCentrifuge
 * 
 *  Public: No
 */


params ["_target", "_player"];

private _items = items _player select {_x isKindOf ["KJW_MedicalExpansion_bloodSample", configFile >> "CfgWeapons"]};
private _spinInProgress = _target getVariable [QGVAR(spinInProgress),false];
private _maximumLoading = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(centrifugeMaxLoad));
private _currentLoaded = _target getVariable [QGVAR(currentLoaded), []];
private _centrifugeUnderCapacity = _maximumLoading < count _currentLoaded;

(count _items > 0) && !_spinInProgress && !_centrifugeUnderCapacity;