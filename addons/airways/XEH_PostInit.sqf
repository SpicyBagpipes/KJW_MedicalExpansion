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
 *  call KJW_MedicalExpansion_Core_XEH_PostInit
 * 
 *  Public: No
 */

call FUNC(addSettings);

[
	"ace_medical_handleUnitVitals",
	{
		params ["_unit", "_deltaT"];
        [_unit, _deltaT] call FUNC(unitProcess);
	}
] call CBA_fnc_addEventHandler;
