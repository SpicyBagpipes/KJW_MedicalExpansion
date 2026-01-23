#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Handles postinit for the addon
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_KAM_Features_XEH_PostInit
 * 
 *  Public: No
 */

["ace_medical_handleUnitVitals", FUNC(updatePlatelets)] call CBA_fnc_addEventHandler;
["ace_medical_handleUnitVitals", FUNC(updateHaemoglobin)] call CBA_fnc_addEventHandler;
