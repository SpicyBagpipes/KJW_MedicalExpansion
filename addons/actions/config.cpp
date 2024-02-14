#include "script_component.hpp"

#if __has_include("\x\kat\addons\main\script_component.hpp")
#define PATCH_SKIP "KAM Loaded"
#endif

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
            "ace_interaction",
            "KJW_MedicalExpansion_Core"
        };
        requiredVersion=1;
		units[] = {""};
		weapons[] = {""};
		vehicles[] = {""};
	};
};

//https://trello.com/b/xH9BBZsd/kjws-medical-expansion

#ifdef PATCH_SKIP
#include "KAM_ACE_Medical_Treatment_Actions.hpp"
#include "CfgWeapons.hpp"
class Extended_PostInit_EventHandlers {
	class COMPONENT_POSTINIT {
		init = QUOTE(call compileScript [QQPATHTOF(XEH_PostInit.sqf)]);
	};
};
#else
#include "ACE_Medical_Treatment_Actions.hpp"
#include "CfgWeapons.hpp"
#endif