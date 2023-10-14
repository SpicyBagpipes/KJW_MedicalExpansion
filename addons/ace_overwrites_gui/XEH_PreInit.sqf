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
 *  [[bob, ted], false] call KJW_MedicalExpansion_ACE_Overwrites_GUI_XEH_PreInit
 * 
 *  Public: No
 */

#include "XEH_PREP.sqf"

KJW_MedicalExpansion_Core_UIElements = createHashmap;
{
	private _bodyPart = _x;
	private _classes = "true" configClasses (configFile >> "ace_medical_gui_BodyImage" >> "controls" >> _bodyPart);
	private _idc = getNumber (configFile >> "ace_medical_gui_BodyImage" >> "controls" >> _bodyPart >> "idc");
	private _output = [_idc];
	private _maps = [];

	{
		private _hash = createHashmap;
		private _idc = getNumber (_x >> "idc");
		private _condition = getText (_x >> "condition");
		private _result = getText (_x >> "result");

		_conditionFnc = {};
		if (isNil _condition) then {
            _conditionFnc = compile _condition;
        } else {
            _conditionFnc = missionNamespace getVariable _condition;
        };
		
		_resultFnc = {};
		if (isNil _result) then {
            _resultFnc = compile _result;
        } else {
            _resultFnc = missionNamespace getVariable _result;
        };

		_hash set ["idc", _idc];
		_hash set ["condition", _conditionFnc];
		_hash set ["result", _resultFnc];
		_maps pushBack _hash;
	} forEach _classes;

	_output pushBack _maps;
	
	KJW_MedicalExpansion_Core_UIElements set [_bodyPart, _output];

} forEach ["Head", "Torso", "ArmLeft", "ArmRight", "LegLeft", "LegRight"];