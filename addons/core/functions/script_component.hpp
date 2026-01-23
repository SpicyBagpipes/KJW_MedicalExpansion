#include "..\script_component.hpp"

//[0, 1, 2, 3, 4, 5, 6, 7] -> [O+, O-, A+, A-, B+, B-, AB+, AB-]
#define BLOODTYPE_OPOS 0
#define BLOODTYPE_ONEG 1
#define BLOODTYPE_APOS 2
#define BLOODTYPE_ANEG 3
#define BLOODTYPE_BPOS 4
#define BLOODTYPE_BNEG 5
#define BLOODTYPE_ABPOS 6
#define BLOODTYPE_ABNEG 7

#define PROB_OPOS 42
#define PROB_ONEG 3
#define PROB_APOS 31
#define PROB_ANEG 2.5
#define PROB_BPOS 15
#define PROB_BNEG 1
#define PROB_ABPOS 5
#define PROB_ABNEG 0.5

#define BODYPARTS ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]
