class ACE_Medical_Treatment_Actions {
	class ApplyTourniquet;
	class BasicBandage;
	class ApplyIV: ApplyTourniquet { // Not needed for KAM
		displayName = "Stage IV Line";
		displayNameProgress = "Staging IV...";
		category = "advanced";
		allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
		items[] = {"KJW_MedicalExpansion_IV"};
		condition = "([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) isEqualTo 0";
		treatmentTime = "7";
		callbackSuccess = QEFUNC(core,addIV);
		litter[] = {};
	};
	class RemoveIV: ApplyIV { // Also not needed for KAM
		displayName = "Remove IV Line";
		displayNameProgress = "Removing IV...";
		items[] = {};
		condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) isEqualTo 1)";
		treatmentTime = "5";
		callbackSuccess = QEFUNC(core,removeIV);
	};
	class PushIV: ApplyIV { // Needed for KAM
		displayName = "Push Selected Fluid";
		displayNameProgress = "Pushing Fluid...";
		items[] = {};
		condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) != 0) && (_medic getVariable ['KJW_MedicalExpansion_Core_SelectedFluid',''] isNotEqualTo '') && [_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication";
		treatmentTime = "7";
		callbackSuccess = QEFUNC(core,pushIV);
		callbackStart = QEFUNC(core,showBloodLabel);
	};
	class Transfusion_500: ApplyIV { // Needed for KAM
		displayName = "Draw 500mL Blood";
		displayNameProgress = "Drawing Blood...";
		items[] = {"KJW_MedicalExpansion_500_TransfusionKit"};
		condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) != 0) && (_patient getVariable ['ace_medical_bloodVolume', 6] > 0.5) && [_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication";
		treatmentTime = "15";
		callbackSuccess = QEFUNC(core,drawBlood);
	};
	class Transfusion_250: ApplyIV { // Needed for KAM
		displayName = "Draw 250mL Blood";
		displayNameProgress = "Drawing Blood...";
		items[] = {"KJW_MedicalExpansion_250_TransfusionKit"};
		condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) != 0) && (_patient getVariable ['ace_medical_bloodVolume', 6] > 0.25) && [_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication";
		treatmentTime = "10";
		callbackSuccess = QEFUNC(core,drawBlood);
	};
	class Sample_10: ApplyIV { // Needed for KAM
		displayName = "Draw 10mL Blood Sample";
		displayNameProgress = "Drawing Blood Sample...";
		items[] = {"KJW_MedicalExpansion_SampleKit"};
		condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) != 0) && (_patient getVariable ['ace_medical_bloodVolume', 6] > 0.01) && [_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication";
		treatmentTime = "4";
		callbackSuccess = QEFUNC(core,drawBlood);
	};

	// Overwrites:
	class CPR: BasicBandage {
		condition = "([_medic, _patient] call ace_medical_treatment_fnc_canCPR) && (!KJW_MedicalExpansion_Core_vestBlocksCPR || [_patient] call KJW_MedicalExpansion_Core_fnc_getVestProtection < 10)";
	};
};