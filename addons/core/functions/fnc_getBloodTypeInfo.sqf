#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Returns blood type info
 * 
 *  Arguments:
 *  0: Type <NUMBER>
 * 
 *  Return Value:
 *  0: Info <ARRAY>
 * 
 *  Example:
 *  [2] call KJW_MedicalExpansion_Core_fnc_getBloodTypeInfo
 * 
 *  Public: Yes
 */


params ["_type"];

private _info = switch _type do {
						//[A, B, +]
	case BLOODTYPE_OPOS: {[false, false, true]};
	case BLOODTYPE_ONEG: {[false, false, false]};
	case BLOODTYPE_APOS: {[true, false, true]};
	case BLOODTYPE_ANEG: {[true, false, false]};
	case BLOODTYPE_BPOS: {[false, true, true]};
	case BLOODTYPE_BNEG: {[false, true, false]};
	case BLOODTYPE_ABPOS: {[true, true, true]};
	case BLOODTYPE_ABNEG: {[true, true, false]};
	default {[true, true, true]};
};
_info