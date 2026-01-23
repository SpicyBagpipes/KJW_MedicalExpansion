class CfgGlasses {
    class G_AirPurifyingRespirator_01_base_F;
    class G_AirPurifyingRespirator_02_base_F;
    class G_Respirator_base_F;
    class G_RegulatorMask_base_F;
	class G_Balaclava_blk;

	#undef BASECLASS
	#define BASECLASS G_AirPurifyingRespirator_01_base_F

	class G_AirPurifyingRespirator_01_F: BASECLASS {
		RATING = 0.95;
	};
	class G_AirPurifyingRespirator_01_nofilter_F: G_AirPurifyingRespirator_01_F {
		ace_arsenal_uniqueBase = "G_AirPurifyingRespirator_01_F";
		RATING = 1;
		REQUIREMENTS = {"B_CombinationUnitRespirator_01_F"};
	};
	
	#undef BASECLASS
	#define BASECLASS G_AirPurifyingRespirator_02_base_F
	
	class G_AirPurifyingRespirator_02_black_F: BASECLASS {
		RATING = 0.95;
	};
	class G_AirPurifyingRespirator_02_black_nofilter_F: G_AirPurifyingRespirator_02_black_F {
		ace_arsenal_uniqueBase = "G_AirPurifyingRespirator_02_black_F";
		RATING = 1;
		REQUIREMENTS = {"B_CombinationUnitRespirator_01_F"};
	};
	class G_AirPurifyingRespirator_02_olive_F: BASECLASS {
		RATING = 0.95;
	};
	class G_AirPurifyingRespirator_02_olive_nofilter_F: G_AirPurifyingRespirator_02_olive_F {
		ace_arsenal_uniqueBase = "G_AirPurifyingRespirator_02_olive_F";
		RATING = 1;
		REQUIREMENTS = {"B_CombinationUnitRespirator_01_F"};
	};
	class G_AirPurifyingRespirator_02_sand_F: BASECLASS {
		RATING = 0.95;
	};
	class G_AirPurifyingRespirator_02_sand_nofilter_F: G_AirPurifyingRespirator_02_sand_F {
		ace_arsenal_uniqueBase = "G_AirPurifyingRespirator_02_sand_F";
		RATING = 1;
		REQUIREMENTS = {"B_CombinationUnitRespirator_01_F"};
	};
	
	#undef BASECLASS
	#define BASECLASS G_RegulatorMask_base_F

	class G_RegulatorMask_F: BASECLASS {
		RATING = 1;
		REQUIREMENTS = {"B_SCBA_01_F"};
	};

	#undef BASECLASS
	#define BASECLASS G_Respirator_base_F

	class G_Respirator_blue_F: BASECLASS {
		RATING = 0.4;
	};
	class G_Respirator_white_F: BASECLASS {
		RATING = 0.4;
	};
	class G_Respirator_yellow_F: BASECLASS {
		RATING = 0.4;
	};

	#undef BASECLASS
	#define BASECLASS G_Balaclava_blk

	class G_Bandanna_blk: BASECLASS {
		RATING = 0.1;
	};
};
