class CfgGlasses {
	class None;
		
	#define FACE_PROTECTION(p1,p2,p3) class p1 : p2 {\
		RATING = p3##;\
	};
	
    FACE_PROTECTION(JCA_G_AirPurifyingRespirator_03_base_F,None,0.9)
    FACE_PROTECTION(JCA_G_AirPurifyingRespirator_04_base_F,None,0.9)
};