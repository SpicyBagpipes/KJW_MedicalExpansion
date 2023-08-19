#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Handles postinit
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_Core_XEH_PostInit
 * 
 *  Public: No
 */


GVAR(fluidData) = createHashmap;

if (hasInterface) then {
	[QGVAR(dataRequest),[player]] call CBA_fnc_serverEvent;
};

call FUNC(addEventHandlers);

GVAR(fluids) = ["KJW_MedicalExpansion_bloodBag_250","KJW_MedicalExpansion_bloodBag_500","KJW_MedicalExpansion_bloodBag_1000"];

player setVariable [QGVAR(bloodInfo),createHashmap,true];