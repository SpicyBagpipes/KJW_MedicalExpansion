class CfgWeapons {
    class ACE_bloodIV_250;
    class ACE_bloodIV_500;
    class ACE_bloodIV;
    #include "fluids\blood_250ml\CfgWeapons.hpp"
    #include "fluids\blood_500ml\CfgWeapons.hpp"
    #include "fluids\blood_1000ml\CfgWeapons.hpp"
	#include "fluids\blood_sample\CfgWeapons.hpp"

	class ACE_ItemCore;
	class CBA_MiscItem_ItemInfo;
	class KJW_MedicalExpansion_IV: ACE_ItemCore {
		KJW_MedicalExpansion_IVType = 1;
		scope = 2;
		displayName = "IV Catheter";
		descriptionShort = "Used for drawing blood or giving the patient fluids";
		picture = QPATHTOF(data\iv.paa);
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 0.25;
		};
	};
	class KJW_MedicalExpansion_500_TransfusionKit: ACE_ItemCore {
		scope = 2;
		displayName = "Empty Blood Bag (500ml)";
		descriptionShort = "Used for taking blood donations";
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 0.25;
		};
	};
	class KJW_MedicalExpansion_250_TransfusionKit: KJW_MedicalExpansion_500_TransfusionKit {
		scope = 2;
		displayName = "Empty Blood Bag (250ml)";
	};
	class KJW_MedicalExpansion_SampleKit: KJW_MedicalExpansion_500_TransfusionKit {
		scope = 2;
		displayName = "Empty Sample Bottle (10ml)";
		descriptionShort = "Used for taking blood to be examined";
		picture = QPATHTOF(data\vial512.paa);
	};
};