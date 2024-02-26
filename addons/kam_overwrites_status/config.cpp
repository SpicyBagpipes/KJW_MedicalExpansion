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
		units[] = {};
		weapons[] = {};
		vehicles[] = {};
        skipWhenMissingDependencies = 1;
	};
};

//https://trello.com/b/xH9BBZsd/kjws-medical-expansion

//Use CfgFunctions
class CfgFunctions {
    class overwrite_ace_medical_status {
        tag = "ace_medical_status";
        class ace_medical_status {
            class getBloodVolumeChange {
                recompile = 1;
                file = QPATHTOF(functions\fnc_getBloodVolumeChange.sqf);
            };
        };
    };
};