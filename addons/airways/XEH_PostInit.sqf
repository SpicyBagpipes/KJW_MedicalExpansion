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
GVAR(normalPtx) = [QGVAR(pneumothorax)];
GVAR(injuryInfo) = createHashMapFromArray [ // Damage coefficients for each injury
    [QGVAR(penetratingChest),0.25],
    [QGVAR(pneumothorax),0.75],
    [QGVAR(tension_pneumothorax),0.8],
    [QGVAR(hemopneumothorax),0.8],
    [QGVAR(tension_hemopneumothorax),1.25]
];

[QGVAR(treatPtxLocal),FUNC(treatPtx)] call CBA_fnc_addEventHandler;
["ace_medical_handleUnitVitals",FUNC(updateVitals)] call CBA_fnc_addEventHandler;

[QGVAR(SpO2factor),FUNC(unitProcess)] call ace_medical_vitals_fnc_addSpO2DutyFactor;
