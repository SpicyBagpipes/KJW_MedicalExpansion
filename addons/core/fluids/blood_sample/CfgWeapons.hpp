class KJW_MedicalExpansion_bloodSample: ACE_bloodIV {
	displayName = "Blood Sample (10ml)";
	scope = 1;
	picture = QPATHTOF(data\vial512full.paa);
	class ItemInfo: ItemInfo {
		mass = 0.01;
	};
};
FLUID_IDS(KJW_MedicalExpansion_bloodSample,Blood Sample (10ml))