class CfgWeapons {
	class ACE_ItemCore;
	class CBA_MiscItem_ItemInfo;

    class KJW_MedicalExpansion_ChestSeal: ACE_ItemCore {
        ACE_isMedicalItem = 1;
		scope = 2;
		displayName = "Chest Seal";
		descriptionShort = "Used for treating penetrating chest wounds";
		picture = QPATHTOF(data\chestseal_icon_ca.paa);
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 0.08;
		};
	};

	class KJW_MedicalExpansion_NCD: ACE_ItemCore {
        ACE_isMedicalItem = 1;
		scope = 2;
		displayName = "ARS Needle";
		descriptionShort = "Used for treating pneumothorax injuries";
		picture = QPATHTOF(data\arsneedle_icon_ca.paa);
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 0.05;
		};
	};

	class KJW_MedicalExpansion_ChestDrain: ACE_ItemCore {
        ACE_isMedicalItem = 1;
		scope = 2;
		displayName = "Chest Drain";
		descriptionShort = "Used for treating hemopneumothorax injuries";
		picture = QPATHTOF(data\chestdrain_icon_ca.paa);
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 0.05;
		};
	};
};
