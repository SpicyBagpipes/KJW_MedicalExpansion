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
        requiredVersion = 2.20;
		units[] = {"KJW_Centrifuge_F"};
		weapons[] = {"KJW_MedicalExpansion_500_TransfusionKit", "KJW_MedicalExpansion_250_TransfusionKit", "KJW_MedicalExpansion_SampleKit"};
		vehicles[] = {};
	};
};

//https://trello.com/b/xH9BBZsd/kjws-medical-expansion

class Extended_PostInit_EventHandlers {
	class COMPONENT_POSTINIT {
		init = QUOTE(call compileScript [QQPATHTOF(XEH_PostInit.sqf)]);
	};
};

class Extended_PreInit_EventHandlers {
	class COMPONENT_PREINIT {
		init = QUOTE(call compileScript [QQPATHTOF(XEH_PreInit.sqf)]);
	};
};

#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "KJW_MedicalExpansion.hpp"
#include "gui.hpp"
#include "ACE_Medical_Injuries.hpp"

class RscControlsGroupNoScrollbars;
class ACE_Medical_GUI_BodyImage: RscControlsGroupNoScrollbars {
    class controls {
        class Background;
        //class ArmLeftB;
        class ArmLeftIV: Background {
            colorText[] = {0.451, 0, 1, 1};
            show = 0;
            idc = 7075;
            text = QPATHTOF(data\body_image\arm_left_iv.paa);
        };
        class ArmRightIV: ArmLeftIV {
            idc = 7080;
            text = QPATHTOF(data\body_image\arm_right_iv.paa);
        };
        class LegLeftIV: ArmLeftIV {
            idc = 7085;
            text = QPATHTOF(data\body_image\leg_left_iv.paa);
        };
        class LegRightIV: ArmLeftIV {
            idc = 7090;
            text = QPATHTOF(data\body_image\leg_right_iv.paa);
        };
    };
};
