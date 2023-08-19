#include "script_component.hpp"

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

class Extended_PostInit_EventHandlers {
	class COMPONENT_POSTINIT {
		init = "call compileScript ['\y\KJW_MedicalExpansion\addons\core\XEH_PostInit.sqf']";
	};
};

class Extended_PreInit_EventHandlers {
	class COMPONENT_PREINIT {
		init = "call compileScript ['\y\KJW_MedicalExpansion\addons\core\XEH_PreInit.sqf']";
	};
};

//Cell counts measured in thousands per ml.
//private _defaultInfo = [[QGVAR(redBloodCellCount),5000],[QGVAR(whiteBloodCellCount),6],[QGVAR(plateletCount),150]];

/*
TODO: (ordered)
- Blood Info system (DONE)
- Blood Types
- Blood Information (DONE - MAJORITY)
- Cannulation
- Blood Refrigeration
- Leave Body Respawn
- Centrifuge
*/

class CfgWeapons {
    class ACE_bloodIV_250;
    class ACE_bloodIV_500;
    class ACE_bloodIV;
    #include "fluids\blood_250ml\CfgWeapons.hpp"
    #include "fluids\blood_500ml\CfgWeapons.hpp"
    #include "fluids\blood_1000ml\CfgWeapons.hpp"
};