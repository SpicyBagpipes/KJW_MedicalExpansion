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
            "ace_interaction",
            "KJW_MedicalExpansion_Core"
        };
        requiredVersion = 2.20;
		units[] = {};
		weapons[] = {};
		vehicles[] = {};
	};
};

//https://trello.com/b/xH9BBZsd/kjws-medical-expansion

#include "ACE_Medical_Treatment_Actions.hpp"
#include "CfgWeapons.hpp"