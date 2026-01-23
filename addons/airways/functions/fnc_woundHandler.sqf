#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Wound handler for airways
 * 
 *  Arguments:
 *  
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_Airways_fnc_woundHandler
 * 
 *  Public: No
 */

params ["_unit", "_allDamages", "_typeOfDamage"];

private _debounced = _unit getVariable [QGVAR(debounce),0];
if (_debounced isEqualTo diag_frameNo) exitWith {_this};

if (random 100 > GVAR(lungSizeCoef)*100) exitWith {_this}; // Didn't hit the lungs

{
    _x params ["_dmgAfter","_sel","_dmgBefore"];
    if (_dmgBefore <= 0 || _dmgAfter <= 0 || _sel != "Body" || _dmgAfter < 0.35) then {continue};
    _unit setVariable [QGVAR(debounce),diag_frameNo]; // We don't want to create multiple injuries on the same frame

    // Add a penetrating injury
    [_unit, _dmgAfter min 0.75, "body", QGVAR(airwayDamage)] call ace_medical_fnc_addDamageToUnit;

    if (_dmgBefore/_dmgAfter <= GVAR(overpenCoef)*100) then {
        // Overpenned, add another penetrating injury here. Note that this is guesswork, but we can explain away any edge cases by it being stopped by the rear plate I guess
        [_unit, _dmgAfter min 0.75, "body", QGVAR(airwayDamage)] call ace_medical_fnc_addDamageToUnit;
    };

    // Start a waitAndExecute for ptx fx
    [FUNC(ptxDegrade), [_unit,_unit getVariable "ace_medical_openWounds"], GVAR(ptxDegradeTime) + (random 50 - 25)] call CBA_fnc_waitAndExecute;

    break; // No point processing any more injuries
} forEach _allDamages;

_this
