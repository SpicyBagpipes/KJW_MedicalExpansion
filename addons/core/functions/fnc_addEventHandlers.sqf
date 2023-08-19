#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds event handlers required for mod to function.
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_Core_fnc_addEventHandlers
 * 
 *  Public: No
 */


if (isServer) then {
	[
		QGVAR(dataRequest),
		{
			params ["_obj"];
			private _info = GVAR(fluidData);
			[QGVAR(dataReturned),_info,_obj] call CBA_fnc_targetEvent;
		}
	] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
	[
		QGVAR(dataReturned),
		{
			params ["_data"];
			GVAR(fluidData) = _data;
		}
	] call CBA_fnc_addEventHandler;
};

[
	QGVAR(dataAdd),
	{
		params ["_data"];
		[_data,"add"] call FUNC(handleData);
	}
] call CBA_fnc_addEventHandler;

[
	QGVAR(dataRemove),
	{
		params ["_data"];
		[_data,"remove"] call FUNC(handleData);
	}
] call CBA_fnc_addEventHandler;