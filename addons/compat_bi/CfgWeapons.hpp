class CfgWeapons {
    class Uniform_Base;
    class H_HelmetB;

	#undef BASECLASS
	#define BASECLASS Uniform_Base
	// NBC Suits
	class U_C_CBRN_Suit_01_Blue_F: BASECLASS {
		RATING = 0.9;
	};
	class U_B_CBRN_Suit_01_Wdl_F: BASECLASS {
		RATING = 0.9;
	};
	class U_B_CBRN_Suit_01_MTP_F: BASECLASS {
		RATING = 0.9;
	};
	class U_B_CBRN_Suit_01_Tropic_F: BASECLASS {
		RATING = 0.9;
	};
	class U_C_CBRN_Suit_01_White_F: BASECLASS {
		RATING = 0.9;
	};
	class U_I_CBRN_Suit_01_AAF_F: BASECLASS {
		RATING = 0.9;
	};
	class U_I_E_CBRN_Suit_01_EAF_F: BASECLASS {
		RATING = 0.9;
	};

	// Special Purpose Suits
	class U_O_V_Soldier_Viper_F: BASECLASS {
		RATING = 0.9;
	};
	class U_O_V_Soldier_Viper_hex_F: BASECLASS {
		RATING = 0.9;
	};

	// Gorkas
	class U_O_R_Gorka_01_F: BASECLASS {
		RATING = 0.3;
	};
	class U_O_R_Gorka_01_black_F: BASECLASS {
		RATING = 0.3;
	};
	class U_O_R_Gorka_01_brown_F: BASECLASS {
		RATING = 0.3;
	};
	class U_O_R_Gorka_01_camo_F: BASECLASS {
		RATING = 0.3;
	};

	#undef BASECLASS
	#define BASECLASS H_HelmetB
	
	// Special Purpose Helmet
	class H_HelmetO_ViperSP_hex_F: BASECLASS {
		RATING = 0.9;
	};
};