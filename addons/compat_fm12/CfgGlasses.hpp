class CfgGlasses {
	class None;
		
	#define FACE_PROTECTION(p1,p2,p3) class p1 : p2 {\
		RATING = p3##;\
	};
	
    FACE_PROTECTION(avon_ct12,None,0.8)
    FACE_PROTECTION(avon_ct12_strapless,None,0.8)
    FACE_PROTECTION(avon_fm12,None,0.8)
    FACE_PROTECTION(avon_fm12_strapless,None,0.8)
    FACE_PROTECTION(avon_SF12,None,0.99)
    FACE_PROTECTION(avon_SF12_strapless,None,0.9)
};