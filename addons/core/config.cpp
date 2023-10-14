#include "script_component.hpp"

class CfgPatches {
    class COMPONENT_GENERAL {
        author="KJW";
        requiredAddons[]=
        {
            "A3_Data_F",
            "A3_Weapons_F",
            "A3_Characters_F",
            "A3_Data_F_AoW_Loadorder",
            "ace_medical_treatment",
            "ace_interaction"
        };
        requiredVersion=1;
		units[] = {""};
		weapons[] = {""};
		vehicles[] = {""};
	};
};

//https://trello.com/b/xH9BBZsd/kjws-medical-expansion

class Extended_PostInit_EventHandlers {
	class COMPONENT_POSTINIT {
		init = "call compileScript ['\y\KJW_MedicalExpansion\addons\core\XEH_PostInit.sqf']";
	};
};

class Extended_PreInit_EventHandlers {
	class COMPONENT_PREINIT {
		init = "call compileScript ['\y\KJW_MedicalExpansion\addons\core\XEH_PreInit.sqf']";
	};
};

#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#include "KJW_MedicalExpansion.hpp"
#include "gui.hpp"