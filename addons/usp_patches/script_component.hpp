#define COMPONENT usp_patches
#include "\y\KJW_MedicalExpansion\addons\core\major_includes.hpp"

#define COMPONENT_BEAUTIFIED MOD_NAME_BEAUTIFIED USP Patches

#define BLOODGROUP(arg) class arg\
		        {\
                    texture = QPATHTOF(data\bloodgroup_##arg##_co.paa);\
                    image = QPATHTOF(data\bloodgroup_##arg##_co.paa);\
                    label = "";\
                    description = QUOTE(##arg##);\
		        };

#define IDENT(arg) class arg\
		        {\
                    texture = QPATHTOF(data\##arg##_co.paa);\
                    image = QPATHTOF(data\##arg##_co.paa);\
                    label = "";\
                    description = QUOTE(##arg##);\
		        };

#define PATCHES values[] += {"a_neg_blk","a_neg_mc","a_pos_blk","a_pos_mc","ab_neg_blk","ab_neg_mc","ab_pos_blk","ab_pos_mc","b_neg_blk","b_neg_mc","b_pos_blk","b_pos_mc","o_neg_blk","o_neg_mc","o_pos_blk","o_pos_mc", "med_blk", "med_mc"};\
                BLOODGROUP(a_neg_blk)\
				BLOODGROUP(a_neg_mc)\
                BLOODGROUP(a_pos_blk)\
                BLOODGROUP(a_pos_mc)\
                BLOODGROUP(ab_neg_blk)\
                BLOODGROUP(ab_neg_mc)\
                BLOODGROUP(ab_pos_blk)\
                BLOODGROUP(ab_pos_mc)\
                BLOODGROUP(b_neg_blk)\
                BLOODGROUP(b_neg_mc)\
                BLOODGROUP(b_pos_blk)\
                BLOODGROUP(b_pos_mc)\
                BLOODGROUP(o_neg_blk)\
                BLOODGROUP(o_neg_mc)\
                BLOODGROUP(o_pos_blk)\
                BLOODGROUP(o_pos_mc)\
                IDENT(med_blk)\
                IDENT(med_mc)
