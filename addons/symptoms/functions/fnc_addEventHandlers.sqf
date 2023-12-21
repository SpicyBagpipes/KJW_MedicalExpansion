#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds event handlers required for the mod to function
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_Symptoms_fnc_addEventHandlers
 * 
 *  Public: No
 */

LINKEVENT(cough)
LINKEVENT(sneeze)
LINKEVENT(sniff)

[
	"ace_medical_handleUnitVitals",
	{
		params ["_unit", "_deltaT"];
        [_unit, _deltaT] call FUNC(unitProcess);
	}
] call CBA_fnc_addEventHandler;