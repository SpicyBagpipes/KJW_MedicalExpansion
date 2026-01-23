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
            "aceax_compat_usp"
        };
        requiredVersion = 2.20;
		units[] = {};
		weapons[] = {};
		vehicles[] = {};
        skipWhenMissingDependencies = 1;
	};
};

class XtdGearModels
{
    class usp_flags;
    class CfgWeapons {
        class USP_G3C {
            class flagleft: usp_flags {
                PATCHES
            };
            class flagright: usp_flags {
                PATCHES
            };
        };
    };
};
