#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  This function is the same as BIN_fnc_CBRNHoseInit except with proper MP handling and handling for all combinations.
 * 
 *  Arguments:
 *  0: Unit <OBJECT>
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player] call KJW_MedicalExpansion_PPE_fnc_hoseInit
 * 
 *  Public: No
 */

params["_unit"];

if (!local _unit) exitWith{};

_gear			= goggles _unit;
_backpack		= backpackContainer _unit;
_backpackType	= backpack _unit;
switch (true) do
{
	case (_gear in ["G_AirPurifyingRespirator_01_F", "G_AirPurifyingRespirator_01_nofilter_F"]):
	{

		//Show the correct hoses for the backpack combi
		switch true do
		{
			case (_backpackType == "B_CombinationUnitRespirator_01_F"):
			{
				//Switch to APR without filter
				_unit linkItem "G_AirPurifyingRespirator_01_nofilter_F";

				_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
				_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
				_backpack setObjectTextureGlobal [3, ""];
			};
			case (_backpackType == "B_SCBA_01_F"):
			{
				//Switch to APR without filter
				_unit linkItem "G_AirPurifyingRespirator_01_nofilter_F";

				_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
				_backpack setObjectTextureGlobal [2, ""];
			};
			default {
				_unit linkItem "G_AirPurifyingRespirator_01_F";
				if (_backpackType == "B_CombinationUnitRespirator_01_F") then {
					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, ""];
				};
				if (_backpackType == "B_SCBA_01_F") then {
					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
	};
	case (_gear in ["G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F"]):
	{
		//Hide the hoses for the backpack combi
		switch true do
		{
			case (_backpackType == "B_CombinationUnitRespirator_01_F"):
			{
				_backpack setObjectTextureGlobal [1, ""];
				_backpack setObjectTextureGlobal [2, ""];
				_backpack setObjectTextureGlobal [3, ""];
			};
			case (_backpackType == "B_SCBA_01_F"):
			{
				_backpack setObjectTextureGlobal [1, ""];
				_backpack setObjectTextureGlobal [2, ""];
			};
		};
	};
	case (_gear == "G_RegulatorMask_F"):
	{
		//Show the correct hoses for the backpack combi
		switch true do
		{
			case (_backpackType == "B_CombinationUnitRespirator_01_F"):
			{
				_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
				_backpack setObjectTextureGlobal [2, ""];
				_backpack setObjectTextureGlobal [3, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
			};
			case (_backpackType == "B_SCBA_01_F"):
			{
				_backpack setObjectTextureGlobal [1, ""];
				_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
			};
			default {
				if (_backpackType == "B_CombinationUnitRespirator_01_F") then {
					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, ""];
				};
				if (_backpackType == "B_SCBA_01_F") then {
					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
	};
	default {
		if (_backpackType == "B_CombinationUnitRespirator_01_F") then {
			_backpack setObjectTextureGlobal [1, ""];
			_backpack setObjectTextureGlobal [2, ""];
			_backpack setObjectTextureGlobal [3, ""];
		};
		if (_backpackType == "B_SCBA_01_F") then {
			_backpack setObjectTextureGlobal [1, ""];
			_backpack setObjectTextureGlobal [2, ""];
		};
	};
};