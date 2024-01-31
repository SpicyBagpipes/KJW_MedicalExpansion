#define MOD_NAME KJW_MedicalExpansion
#define MOD_NAME_BEAUTIFIED KJW's Medical Expansion

#define COMPONENT_GENERAL MOD_NAME##_##COMPONENT

#define COMPONENT_POSTINIT COMPONENT_GENERAL##_PostInit

#define COMPONENT_PREINIT COMPONENT_GENERAL##_PreInit

#define QUOTE(P1) #P1
#define QQUOTE(P1) QUOTE(QUOTE(P1))

#define GVAR(P1) COMPONENT_GENERAL##_##P1
#define QGVAR(P1) QUOTE(GVAR(P1))
#define QQGVAR(P1) QQUOTE(GVAR(P1))

#define EGVAR(P1,P2) MOD_NAME##_##P1##_##P2
#define QEGVAR(P1,P2) QUOTE(EGVAR(P1,P2))
#define QQEGVAR(P1,P2) QQUOTE(EGVAR(P1,P2))

#define FUNC(P1) COMPONENT_GENERAL##_fnc_##P1
#define QFUNC(P1) QUOTE(FUNC(P1))
#define QQFUNC(P1) QQUOTE(FUNC(P1))

#define EFUNC(P1,P2) MOD_NAME##_##P1##_fnc_##P2
#define QEFUNC(P1,P2) QUOTE(EFUNC(P1,P2))
#define QQEFUNC(P1,P2) QUOTE(QEFUNC(P1,P2))

#define PATHTOF(P1) \y\##MOD_NAME##\addons\##COMPONENT##\##P1
#define QPATHTOF(P1) QUOTE(PATHTOF(P1))
#define QQPATHTOF(P1) QUOTE(QPATHTOF(P1))

#define PATHTOEF(P1,P2) \y\##MOD_NAME##\addons\##P1##\##P2
#define QPATHTOEF(P1,P2) QUOTE(PATHTOEF(P1,P2))

//#define MACRO_FUNCPATH(FUNCNAME) COMPONENT##\functions\fnc_##FUNCNAME

#define FUNCTION_DECLARE(FUNCTIONNAME) class FUNCTIONNAME {\
				file = QPATHTOF(functions\fnc_##FUNCTIONNAME##.sqf);\
				recompile = 1;\
            };
//file = QUOTE(MACRO_FUNCPATH(FUNCTIONNAME).sqf);

#define PREP(FUNCTIONNAME) COMPONENT_GENERAL##_fnc_##FUNCTIONNAME = compile preProcessFileLineNumbers '\y\##MOD_NAME##\addons\##COMPONENT##\functions\fnc_##FUNCTIONNAME##.sqf';

#define RATING KJW_MedicalExpansion_PPE_Rating
#define REQUIREMENTS KJW_MedicalExpansion_PPE_Requirements[]