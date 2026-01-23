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
            "PMK1_Gas_mask"
        };
        requiredVersion = 2.20;
		units[] = {};
		weapons[] = {};
		vehicles[] = {};
        skipWhenMissingDependencies = 1;
	};
};

#include "CfgGlasses.hpp"
