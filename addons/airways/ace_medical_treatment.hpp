class ace_medical_treatment {
    class Bandaging {
        class KJW_MedicalExpansion_ChestSeal {
            effectiveness = 0;
            reopeningChance = 0;
            class GVAR(penetratingChest) {
                effectiveness = 10;
                reopeningChance = 0;
                reopeningMaxDelay = 0;
                reopeningMinDelay = 0;
            };
            class GVAR(penetratingChestLarge): GVAR(penetratingChest) {};
            class GVAR(penetratingChestMedium): GVAR(penetratingChest) {};
            class GVAR(penetratingChestMinor): GVAR(penetratingChest) {};
        };
    };
};