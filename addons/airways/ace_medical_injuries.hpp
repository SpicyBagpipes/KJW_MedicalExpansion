class ACE_Medical_Injuries {
    class damageTypes {
        class GVAR(airwayDamage) {
            selectionSpecific = 1;
            class GVAR(penetratingChest) {
                weighting[] = {{1.5, 1}, {0.35, 1}, {0.35, 0}};
            };
        };
        class woundHandlers {
            GVAR(penetration) = QFUNC(woundHandler);
        };
    };
    class wounds {
        class GVAR(penetratingChest) {
            bleeding = 0;
            pain = 1;
        };
    };
};
