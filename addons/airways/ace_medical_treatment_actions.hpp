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
};