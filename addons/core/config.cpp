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

class CfgFunctions {
    class KJW_MedicalExpansion_Core {
        class functions {
            
        };
    };
};

class Extended_PostInit_EventHandlers {
	class COMPONENT_POSTINIT {
		init = QUOTE(call compileScript ['COMPONENT\XEH_PostInit.sqf']);
	};
};

class Extended_PreInit_EventHandlers {
	class COMPONENT_PREINIT {
		init = QUOTE(call compileScript ['COMPONENT\XEH_PreInit.sqf']);
	};
};