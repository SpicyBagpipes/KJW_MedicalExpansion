class ace_medical_treatment_actions {
    class BasicBandage;
    class KJW_MedicalExpansion_ChestSeal : BasicBandage {
        allowedSelections[] = {"Body"};
        //callbackSuccess = QFUNC(chestSeal);
        category = "Airway";
        condition = QFUNC(canApplyChestSeal);
        displayName = "Apply Chest Seal";
        displayNameProgress = "Applying Chest Seal...";
        items[] = {"KJW_MedicalExpansion_ChestSeal"};
        treatmentTime = 5;
    };
    class KJW_MedicalExpansion_NCD : KJW_MedicalExpansion_ChestSeal {
        callbackSuccess = QFUNC(treatPtx);
        condition = QFUNC(canNCD);
        displayName = "Needle Decompression";
        displayNameProgress = "Applying Needle Decompression...";
        items[] = {"KJW_MedicalExpansion_NCD"};
        treatmentTime = 5;
    };
    class KJW_MedicalExpansion_ChestDrain : KJW_MedicalExpansion_ChestSeal {
        callbackSuccess = QFUNC(treatPtx);
        condition = QFUNC(canChestDrain);
        displayName = "Chest Drain";
        displayNameProgress = "Applying Chest Drain...";
        items[] = {"KJW_MedicalExpansion_ChestDrain"};
        treatmentTime = 15;
    };
};