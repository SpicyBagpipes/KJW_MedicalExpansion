class ACE_Medical_Treatment_Actions {
	class ApplyTourniquet;
	class BasicBandage;
	class PushIV: ApplyTourniquet { // Needed for KAM
		displayName = "Push Selected Fluid";
		displayNameProgress = "Pushing Fluid...";
		category = "advanced";
		allowedSelections[] = {"LeftArm", "RightArm", "LeftLeg", "RightLeg"};
		items[] = {};
		condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) >= 1) && (_medic getVariable ['KJW_MedicalExpansion_Core_SelectedFluid',''] isNotEqualTo '') && [_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication";
		callbackSuccess = QEFUNC(core,pushIV);
		callbackStart = QEFUNC(core,showBloodLabel);
		treatmentTime = "5";
		litter[] = {};
	};
	class Transfusion_500: ApplyTourniquet { // Needed for KAM
		displayName = "Draw 500mL Blood";
		displayNameProgress = "Drawing Blood...";
		items[] = {"KJW_MedicalExpansion_500_TransfusionKit"};
		condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) >= 1) && (_patient getVariable ['ace_medical_bloodVolume', 6] > 0.5) && [_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication";
		callbackSuccess = QEFUNC(core,drawBlood);
	};
	class Transfusion_250: ApplyTourniquet { // Needed for KAM
		displayName = "Draw 250mL Blood";
		displayNameProgress = "Drawing Blood...";
		items[] = {"KJW_MedicalExpansion_250_TransfusionKit"};
		condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) >= 1) && (_patient getVariable ['ace_medical_bloodVolume', 6] > 0.25) && [_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication";
		callbackSuccess = QEFUNC(core,drawBlood);
	};
	class Sample_10: ApplyTourniquet { // Needed for KAM
		displayName = "Draw 10mL Blood Sample";
		displayNameProgress = "Drawing Blood Sample...";
		items[] = {"KJW_MedicalExpansion_SampleKit"};
		condition = "(([_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_hasIV) >= 1) && (_patient getVariable ['ace_medical_bloodVolume', 6] > 0.01) && [_patient, _bodyPart] call KJW_MedicalExpansion_Core_fnc_canAddNewMedication";
		callbackSuccess = QEFUNC(core,drawBlood);
	};

	// Overwrites:
	class CPR: BasicBandage {
		condition = "(([_medic, _patient] call ace_medical_treatment_fnc_canCPR) && !(_patient getVariable ['kat_airway_recovery', false])) && (!KJW_MedicalExpansion_Core_vestBlocksCPR || [_patient] call KJW_MedicalExpansion_Core_fnc_getVestProtection < 10)"
	};
};