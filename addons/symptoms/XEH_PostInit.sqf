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
 *  call KJW_MedicalExpansion_Symptoms_XEH_PostInit
 * 
 *  Public: No
 */

call FUNC(addSettings);
call FUNC(addEventHandlers);