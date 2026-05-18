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

if ("airway" in toLowerANSI _typeOfDamage) exitWith {_this}; // Don't know a better way without config lookup every wound handling...

private _debounced = _unit getVariable [QGVAR(debounce),0];
if (_debounced isEqualTo diag_frameNo) exitWith {_this};

if (random 100 > GVAR(lungSizeCoef)*100) exitWith {_this}; // Didn't hit the lungs

{
    _x params ["_dmgAfter","_sel","_dmgBefore"];
    if (_dmgBefore <= 0 || _dmgAfter <= 0 || _sel != "Body" || _dmgAfter < 0.35) then {continue};
    _unit setVariable [QGVAR(debounce),diag_frameNo]; // We don't want to create multiple injuries on the same frame

    // Add a penetrating injury
    [_unit, _dmgAfter min 0.05, "body", QGVAR(airwayDamage)] call ace_medical_fnc_addDamageToUnit;

    private _overpenned = false;
    if (_dmgBefore/_dmgAfter <= GVAR(overpenCoef)*100) then {
        // Overpenned, add another penetrating injury here. Note that this is guesswork, but we can explain away any edge cases by it being stopped by the rear plate I guess
        _overpenned = true;
        [_unit, _dmgAfter min 0.05, "body", QGVAR(airwayDamage)] call ace_medical_fnc_addDamageToUnit;
    };

    /* TODO:
        If 2 penetrating injuries, give it a hemopneumothorax
        Otherwise, give it a pneumothorax

        In updatevitals check for chest wounds. If there is none with ptx, fix the ptx after a couple seconds.
        If there is none with hptx, do nothing.

        If hemopneumothorax gets the degrade time and is worse, degrade into TENSION hemopneumothorax
        If pneumothorax gets the degrade time and is untreated, degrade into TENSION pneumothorax
    */

    if !_overpenned then {
        // Give a single pneumothorax
        [_unit, "body", [QGVAR(pneumothorax), 1, 1, 0.6]] call ace_medical_fnc_addWound;
    } else { // There is more chest wounds
        // Give a single hemopneumothorax
        [_unit, "body", [QGVAR(hemopneumothorax), 1, 1, 0.6]] call ace_medical_fnc_addWound;
    };

    // Start a waitAndExecute for ptx fx
    [FUNC(ptxDegrade), [_unit, _unit getVariable "ace_medical_openWounds", _overpenned], 5/*GVAR(ptxDegradeTime) + (random 50 - 25)*/] call CBA_fnc_waitAndExecute;

    break; // No point processing any more injuries
} forEach _allDamages;

_this
