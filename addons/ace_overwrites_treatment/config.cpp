#include "script_component.hpp"

class CfgPatches {
    class COMPONENT_GENERAL {
        author="KJW";
        requiredAddons[]=
        {
            "A3_Data_F",
            "A3_Weapons_F",
            "A3_Characters_F",
            "A3_Data_F_AoW_Loadorder"
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
		init = "call compileScript ['\y\KJW_MedicalExpansion\addons\ace_overwrites_treatment\XEH_PostInit.sqf']";
	};
};

class Extended_PreInit_EventHandlers {
	class COMPONENT_PREINIT {
		init = "call compileScript ['\y\KJW_MedicalExpansion\addons\ace_overwrites_treatment\XEH_PreInit.sqf']";
	};
};

//Use CfgFunctions
class CfgFunctions {
    class ACE_Medical_Treatment {
        class Functions {
            FUNCTION_DECLARE(ivBag)
            FUNCTION_DECLARE(ivBagLocal)
        };
    };
};