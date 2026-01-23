#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Function description
 * 
 *  Arguments:
 *  0: Objects <ARRAY>
 *  1: All <BOOL>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [[bob, ted], false] call KJW_MedicalExpansion_ACE_Overwrites_GUI_fnc_handleLimbFractureColor
 * 
 *  Public: No
 */


params ["_tourniquets", "_fractures", "_IVs", "_bodyPartIndex", "_showElement", "_ctrl"];
if (_showElement) then {
	switch (_fractures select _bodyPartIndex) do {
		case 1: {
			_ctrl ctrlShow true;
			_ctrl ctrlSetTextColor [1, 0, 0, 1];
		};
		case -1: {
			if (ace_medical_fractures in [2, 3]) then {
				_ctrl ctrlShow true;
				_ctrl ctrlSetTextColor [0, 0, 1, 1];
			} else {
				_ctrl ctrlShow false;
			};
		};
	};
};
