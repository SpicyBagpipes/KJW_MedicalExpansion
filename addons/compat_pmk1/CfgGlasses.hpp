class CfgGlasses {
    class None;
	
	#define FACE_PROTECTION(p1,p2,p3) class p1 : p2 {\
		RATING = p3##;\
	};

	FACE_PROTECTION(PMK_1_Gas_mask_B1_F,None,0.7)
};