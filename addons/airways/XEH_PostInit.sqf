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
GVAR(ncdInjuries) = [QGVAR(pneumothorax),QGVAR(tension_pneumothorax)];
GVAR(chestDrainInjuries) = [QGVAR(hemopneumothorax),QGVAR(tension_hemopneumothorax)];

[QGVAR(treatPtxLocal),FUNC(treatPtx)] call CBA_fnc_addEventHandler;

[QGVAR(SpO2factor),FUNC(unitProcess)] call ace_medical_vitals_fnc_addSpO2DutyFactor;
