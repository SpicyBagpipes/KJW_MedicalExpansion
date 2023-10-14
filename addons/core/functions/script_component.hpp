#include "..\script_component.hpp"

//[1, 2, 3, 4, 5, 6, 7, 8] -> [O+, O-, A+, A-, B+, B-, AB+, AB-]
#define BLOODTYPE_OPOS 1
#define BLOODTYPE_ONEG 2
#define BLOODTYPE_APOS 3
#define BLOODTYPE_ANEG 4
#define BLOODTYPE_BPOS 5
#define BLOODTYPE_BNEG 6
#define BLOODTYPE_ABPOS 7
#define BLOODTYPE_ABNEG 8

#define PROB_OPOS 42
#define PROB_ONEG 3
#define PROB_APOS 31
#define PROB_ANEG 2.5
#define PROB_BPOS 15
#define PROB_BNEG 1
#define PROB_ABPOS 5
#define PROB_ABNEG 0.5

#define BODYPARTS ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]