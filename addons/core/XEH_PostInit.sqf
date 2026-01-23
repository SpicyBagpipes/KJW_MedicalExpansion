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


if (isNil QGVAR(fluidData)) then {
	GVAR(fluidData) = createHashmap;
};

GVAR(defaultBloodInfo) = [["RBC", 24],["WBC", 24],["Platelet", 24]]; //Strength, 0-24 as it is 1 per 250ml, 24 is 6000/250, 6000 is max blood volume in ace medical

GVAR(KAMLoaded) = isClass (configFile >> "CfgPatches" >> "kat_main");

call FUNC(addEventHandlers);
call FUNC(module_registerModules);

if (hasInterface) then {
	[QGVAR(dataRequest),[player]] call CBA_fnc_serverEvent;
};

GVAR(fluids) = ["KJW_MedicalExpansion_bloodBag_250","KJW_MedicalExpansion_bloodBag_500","KJW_MedicalExpansion_bloodBag_1000"];

[{
	{
		//Add inspect context menu action
		[_x, "CONTAINER", "Inspect", [1,1,1,1], "a3\3den\data\cfgwaypoints\seekanddestroy_ca.paa", {true}, {
            params ["_unit", "_container", "_item", "_slot", "_params"];
			[_item] call FUNC(showBloodLabel);
            true
        }, false, [0,1,2]] call CBA_fnc_addItemContextMenuOption;

		//Add select context menu action
		[_x, "CONTAINER", "Select", [1,1,1,1], "a3\3den\data\cfgwaypoints\hold_ca.paa", {true}, {
            params ["_unit", "_container", "_item", "_slot", "_params"];
			_unit setVariable [QGVAR(selectedFluid), _item, true];
            false
        }, false, [0,1,2]] call CBA_fnc_addItemContextMenuOption;

	} forEach GVAR(fluids);
},[],0.25] call CBA_fnc_waitAndExecute; //Give other addons time to pushback into GVAR(fluids)

GVAR(bloodTransmissiveInfo) = [
	"RBC",
	"WBC",
	"Platelet"
]; //Array of all keys that spread across the blood. All bloodinfo is sent. These also tick down when bleeding.

[QGVAR(postInitialised),[]] call CBA_fnc_localEvent;
