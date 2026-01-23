class CfgWeapons {
	class ACE_ItemCore;
	class CBA_MiscItem_ItemInfo;

    class KJW_MedicalExpansion_ChestSeal: ACE_ItemCore {
        ACE_isMedicalItem = 1;
		scope = 2;
		displayName = "Chest Seal";
		descriptionShort = "Used for treating penetrating chest wounds";
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 0.08;
		};
	};
};