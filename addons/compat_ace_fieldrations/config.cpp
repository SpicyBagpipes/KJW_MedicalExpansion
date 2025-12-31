#include "script_component.hpp"

#if __MONTH__ != 10
#if __DAY__ < 28
#define PATCH_SKIP "spooky szn"
#endif
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
        requiredVersion = 2.20;
		units[] = {};
		weapons[] = {};
		vehicles[] = {};
        not_halloween = 1;
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
        requiredVersion = 2.20;
		units[] = {};
		weapons[] = {};
		vehicles[] = {};
	};
};

//https://trello.com/b/xH9BBZsd/kjws-medical-expansion

class CfgWeapons {
    class ACE_bloodIV;
    class KJW_MedicalExpansion_bloodSample: ACE_bloodIV {
        ACE_isFieldRationItem = 1;
        acex_field_rations_consumeAnims[] = {"ace_field_rations_drinkStand","ace_field_rations_drinkCrouch","ace_field_rations_drinkProne"};
        acex_field_rations_consumeSounds[] = {"ace_field_rations_drink1","ace_field_rations_drink1","ace_field_rations_drink2"};
        acex_field_rations_consumeText = "Drinking from %1...";
        acex_field_rations_consumeTime = 10;
        acex_field_rations_thirstQuenched = 10;
        acex_field_rations_replacementItem = "";
    };
};
#endif