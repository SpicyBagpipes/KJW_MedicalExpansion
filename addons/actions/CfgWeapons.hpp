class CfgWeapons {
	class ACE_ItemCore;
	class CBA_MiscItem_ItemInfo;
	class KJW_MedicalExpansion_IV: ACE_ItemCore {
		KJW_MedicalExpansion_IVType = 1;
		scope = 2;
		displayName = "IV Catheter";
		descriptionShort = "Used for drawing blood or giving the patient fluids";
		picture = QPATHTOEF(core,data\iv.paa);
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 0.25;
		};
	};
};