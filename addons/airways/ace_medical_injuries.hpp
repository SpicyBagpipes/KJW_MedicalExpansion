class ACE_Medical_Injuries {
    class damageTypes {
        class GVAR(airwayDamage) {
            selectionSpecific = 1;
            class GVAR(penetratingChest) {
                weighting[] = {{1.5, 1}, {0.35, 1}, {0.35, 0}};
            };
        };
        class GVAR(pneumothoraxDmg) {
            selectionSpecific = 1;
            class GVAR(pneumothorax) {
                weighting[] = {{1.5,0},{1.5,1},{1.5,0}};
            };
        };
        class GVAR(tension_pneumothoraxDmg) {
            selectionSpecific = 1;
            class GVAR(tension_pneumothorax) {
                weighting[] = {{1.5,0},{1.5,1},{1.5,0}};
            };
        };
        class GVAR(hemopneumothoraxDmg) {
            selectionSpecific = 1;
            class GVAR(hemopneumothorax) {
                weighting[] = {{1.5,0},{1.5,1},{1.5,0}};
            };
        };
        class GVAR(tension_hemopneumothoraxDmg) {
            selectionSpecific = 1;
            class GVAR(tension_hemopneumothorax) {
                weighting[] = {{1.5,0},{1.5,1},{1.5,0}};
            };
        };
        class woundHandlers {
            GVAR(penetration) = QFUNC(woundHandler);
        };
    };
    class wounds {
        class GVAR(penetratingChest) {
            bleeding = 0.05;
            pain = 0.2;
        };
        class GVAR(pneumothorax) {
            bleeding = 0;
            pain = 1;
        };
        class GVAR(tension_pneumothorax) {
            bleeding = 0;
            pain = 1;
        };
        class GVAR(hemopneumothorax) {
            bleeding = 0;
            pain = 1;
        };
        class GVAR(tension_hemopneumothorax) {
            bleeding = 0;
            pain = 1;
        };
    };
};
