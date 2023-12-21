class CfgGlasses {
	class gm_gasmask_base;
		
	#define FACE_PROTECTION(p1,p2,p3) class p1 : p2 {\
		RATING = p3##;\
	};
	
    FACE_PROTECTION(gm_ge_facewear_m65,gm_gasmask_base,0.9)
    FACE_PROTECTION(gm_gc_army_facewear_schm41m,gm_gasmask_base,0.9)
};