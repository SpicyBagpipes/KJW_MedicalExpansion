#define COMPONENT core
#include "\y\KJW_MedicalExpansion\addons\core\major_includes.hpp"
#define COMPONENT_BEAUTIFIED MOD_NAME_BEAUTIFIED Core

//Significantly helped by TFAR's radio_ids.hpp

#define FLUID_ID_full(baseClass,displayNameBase) class baseClass##_1 : baseClass \
    { \
        displayName = QUOTE(displayNameBase); \
        scope = 1; \
        scopeCurator = 1; \
        scopeArsenal = 1; \
        ace_arsenal_hide = 1; \
        ace_arsenal_uniqueBase = QUOTE(baseClass); \
    };


#define FLUID_IDS_1(baseClass,displayNameBase,index) class baseClass##_##index : baseClass##_1 \
{ \
    displayName = QUOTE(displayNameBase); \
};

#define FLUID_IDS_10(baseClass,displayNameBase,index10) \
    FLUID_IDS_1(baseClass,displayNameBase,index10##0) \
    FLUID_IDS_1(baseClass,displayNameBase,index10##1) \
    FLUID_IDS_1(baseClass,displayNameBase,index10##2) \
    FLUID_IDS_1(baseClass,displayNameBase,index10##3) \
    FLUID_IDS_1(baseClass,displayNameBase,index10##4) \
    FLUID_IDS_1(baseClass,displayNameBase,index10##5) \
    FLUID_IDS_1(baseClass,displayNameBase,index10##6) \
    FLUID_IDS_1(baseClass,displayNameBase,index10##7) \
    FLUID_IDS_1(baseClass,displayNameBase,index10##8) \
    FLUID_IDS_1(baseClass,displayNameBase,index10##9)

#define FLUID_IDS_100(baseClass,displayNameBase,index100) \
    FLUID_IDS_10(baseClass,displayNameBase,index100##0) \
    FLUID_IDS_10(baseClass,displayNameBase,index100##1) \
    FLUID_IDS_10(baseClass,displayNameBase,index100##2) \
    FLUID_IDS_10(baseClass,displayNameBase,index100##3) \
    FLUID_IDS_10(baseClass,displayNameBase,index100##4) \
    FLUID_IDS_10(baseClass,displayNameBase,index100##5) \
    FLUID_IDS_10(baseClass,displayNameBase,index100##6) \
    FLUID_IDS_10(baseClass,displayNameBase,index100##7) \
    FLUID_IDS_10(baseClass,displayNameBase,index100##8) \
    FLUID_IDS_10(baseClass,displayNameBase,index100##9)


#define FLUID_IDS_999(baseClass,displayNameBase) \
    FLUID_IDS_1(baseClass,displayNameBase,2) \
    FLUID_IDS_1(baseClass,displayNameBase,3) \
    FLUID_IDS_1(baseClass,displayNameBase,4) \
    FLUID_IDS_1(baseClass,displayNameBase,5) \
    FLUID_IDS_1(baseClass,displayNameBase,6) \
    FLUID_IDS_1(baseClass,displayNameBase,7) \
    FLUID_IDS_1(baseClass,displayNameBase,8) \
    FLUID_IDS_1(baseClass,displayNameBase,9) \
    FLUID_IDS_10(baseClass,displayNameBase,1) \
    FLUID_IDS_10(baseClass,displayNameBase,2) \
    FLUID_IDS_10(baseClass,displayNameBase,3) \
    FLUID_IDS_10(baseClass,displayNameBase,4) \
    FLUID_IDS_10(baseClass,displayNameBase,5) \
    FLUID_IDS_10(baseClass,displayNameBase,6) \
    FLUID_IDS_10(baseClass,displayNameBase,7) \
    FLUID_IDS_10(baseClass,displayNameBase,8) \
    FLUID_IDS_10(baseClass,displayNameBase,9) \
    FLUID_IDS_100(baseClass,displayNameBase,1) \
    FLUID_IDS_100(baseClass,displayNameBase,2) \
    FLUID_IDS_100(baseClass,displayNameBase,3) \
    FLUID_IDS_100(baseClass,displayNameBase,4) \
    FLUID_IDS_100(baseClass,displayNameBase,5) \
    FLUID_IDS_100(baseClass,displayNameBase,6) \
    FLUID_IDS_100(baseClass,displayNameBase,7) \
    FLUID_IDS_100(baseClass,displayNameBase,8) \
    FLUID_IDS_100(baseClass,displayNameBase,9) \
    FLUID_IDS_1(baseClass,displayNameBase,1000)

#define FLUID_IDS(baseClass,displayNameBase) \
    FLUID_ID_full(baseClass,displayNameBase) \
    FLUID_IDS_999(baseClass,displayNameBase)