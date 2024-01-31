#include "script_component.hpp"

#if __has_include("\x\kat\addons\main\script_component.hpp")
#define PATCH_SKIP "KAM Loaded"
#endif

#ifdef PATCH_SKIP
class CfgPatches {
    class KJW_Overwrites_NotLoaded {
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
        ace_overwrites_status = 1;
    };
};
#else
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

//Use CfgFunctions
class CfgFunctions {
    class overwrite_ACE_Medical_Treatment {
        tag = "ace_medical_treatment";
        class ace_medical_treatment {
            class ivBag {
                recompile = 1;
                file = QPATHTOF(functions\fnc_ivBag.sqf);
            };
            class ivBagLocal {
                recompile = 1;
                file = QPATHTOF(functions\fnc_ivBagLocal.sqf);
            };
        };
    };
};
#endif