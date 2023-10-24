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
            "kat_pharma"
        };
        requiredVersion = 1;
		units[] = {""};
		weapons[] = {""};
		vehicles[] = {""};
        skipWhenMissingDependencies = 1;
	};
};

//https://trello.com/b/xH9BBZsd/kjws-medical-expansion

class Extended_PostInit_EventHandlers {
	class COMPONENT_POSTINIT {
		init = "call compileScript ['\y\KJW_MedicalExpansion\addons\kam_features\XEH_PostInit.sqf']";
	};
};

class Extended_PreInit_EventHandlers {
	class COMPONENT_PREINIT {
		init = "call compileScript ['\y\KJW_MedicalExpansion\addons\kam_features\XEH_PreInit.sqf']";
	};
};