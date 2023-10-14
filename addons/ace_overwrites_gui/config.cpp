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
            "ace_medical_gui"
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
		init = "call compileScript ['\y\KJW_MedicalExpansion\addons\ace_overwrites_gui\XEH_PostInit.sqf']";
	};
};

class Extended_PreInit_EventHandlers {
	class COMPONENT_PREINIT {
		init = "call compileScript ['\y\KJW_MedicalExpansion\addons\ace_overwrites_gui\XEH_PreInit.sqf']";
	};
};

//Use CfgFunctions
class CfgFunctions {
    class ACE_Medical_GUI {
        class Functions {
            FUNCTION_DECLARE(updateInjuryList)
            FUNCTION_DECLARE(updateBodyImage)
        };
    };
};

class RscControlsGroupNoScrollbars;
class ACE_Medical_GUI_BodyImage: RscControlsGroupNoScrollbars {
    class controls {

        class Background;

        // Templates
        class templateiv: Background {
            condition = "params ['', '', '_IVs', '_bodyPartIndex']; _IVs select _bodyPartIndex isEqualTo 1";
            result = "";
            show = 0;
        };
        class templatefracture: Background {
            condition = "params ['', '_fractures', '', '_bodyPartIndex']; _fractures select _bodyPartIndex != 0";
            result = "KJW_MedicalExpansion_Core_fnc_handleLimbFractureColor";
            show = 0;
        };
        class templatetourniquet: Background {
            condition = "params ['_tourniquets', '', '', '_bodyPartIndex']; _tourniquets select _bodyPartIndex != 0";
            result = "";
            show = 0;
        };

        class ArmLeft: Background {
            class fracture: templatefracture {
                idc = 6055;
            };
            class tourniquet: templatetourniquet {
                idc = 6035;
            };
            class iv: templateiv {
                idc = 6075;
            };
        };
        class ArmRight: Background {
            class fracture: templatefracture {
                idc = 6060;
            };
            class tourniquet: templatetourniquet {
                idc = 6040;
            };
            class iv: templateiv {
                idc = 6080;
            };
        };
        class LegLeft: Background {
            class fracture: templatefracture {
                idc = 6065;
            };
            class tourniquet: templatetourniquet {
                idc = 6045;
            };
            class iv: templateiv {
                idc = 6085;
            };
        };
        class LegRight: Background {
            class fracture: templatefracture {
                idc = 6070;
            };
            class tourniquet: templatetourniquet {
                idc = 6050;
            };
            class iv: templateiv {
                idc = 6090;
            };
        };
        class ArmLeftB;
        class ArmLeftIV: ArmLeftB {
            colorText[] = {0.451 ,0, 1, 1};
            show = 0;
            idc = 6075;
            text = QPATHTOF(data\body_image\arm_left_iv.paa);
        };
        class ArmRightIV: ArmLeftIV {
            idc = 6080;
            text = QPATHTOF(data\body_image\arm_right_iv.paa);
        };
        class LegLeftIV: ArmLeftIV {
            idc = 6085;
            text = QPATHTOF(data\body_image\leg_left_iv.paa);
        };
        class LegRightIV: ArmLeftIV {
            idc = 6090;
            text = QPATHTOF(data\body_image\leg_right_iv.paa);
        };
    };
};