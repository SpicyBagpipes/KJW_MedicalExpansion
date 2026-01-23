#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Handles postinit.
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_Airways_XEH_PostInit
 * 
 *  Public: No
 */

call FUNC(addSettings);

GVAR(lungInjuries) = [QGVAR(penetratingChest)];

[QGVAR(SpO2factor),FUNC(unitProcess)] call ace_medical_vitals_fnc_addSpO2DutyFactor;
