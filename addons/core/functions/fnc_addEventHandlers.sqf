#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds event handlers required for mod to function.
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_Core_fnc_addEventHandlers
 * 
 *  Public: No
 */


if (isServer) then {
	[
		QGVAR(dataRequest),
		{
			params ["_obj"];
			private _info = GVAR(fluidData);
			[QGVAR(dataReturned), _info, _obj] call CBA_fnc_targetEvent;
		}
	] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
	[
		QGVAR(dataReturned),
		{
			params ["_data"];
			GVAR(fluidData) = _data;
		}
	] call CBA_fnc_addEventHandler;

	[
		QGVAR(giveBlood),
		{
			params ["_medic", "_unit", "_bloodBag"];
			private _bloodInfo = _unit getVariable [QGVAR(bloodInfo), ""];
			if (_bloodInfo isEqualTo "") exitWith {
				systemChat "This unit had no blood information as it does not inherit from CAManBase. You should never see this error message. Please contact the author of the mod which adds this unit.";
				//Above message *should* never be seen.
			};
			[QGVAR(dataAdd),[[_bloodBag, _bloodInfo], _medic]] call CBA_fnc_globalEvent;
		}
	] call CBA_fnc_addEventHandler;

	[
		"loadout",
		{
			private _fluid = player getVariable [QGVAR(selectedFluid),""];
			if (!(_fluid in items player) && (_fluid isNotEqualTo "")) then {
				player setVariable [QGVAR(selectedFluid), "", true];
			};
		}
	] call CBA_fnc_addPlayerEventHandler;

	[true, "OnGameInterrupt", { // Leave body respawn
		params ["_display"]; 
		private _buttonRespawn = _display displayctrl 1010;
		uiNamespace setVariable ["KJW_RespawnDisplay", _display];
		_buttonRespawn ctrlSetEventHandler ["ButtonClick", toString { 
			private _unconscious = lifeState player == "INCAPACITATED";
			private _display = uiNamespace getVariable ["KJW_RespawnDisplay",displayNull];
			if (_unconscious && GVAR(leaveBodyRespawn)) then {
				private _type = typeOf player;
				private _group = group player;
				private _unit = _group createUnit [_type, [0,0,0], [], 0, "NONE"];
				selectPlayer _unit;
				_unit setDamage 1;
				deleteVehicle _unit;
				_display closeDisplay 2;
			} else {
				player setDamage 1;
				_display closeDisplay 2;
			};
		}]; 
	}] call BIS_fnc_addScriptedEventHandler;
};

[
	QGVAR(dataAdd),
	{
		params ["_data","_unit"];
		private _id = [_data,"add"] call FUNC(handleData);
		if (_unit isEqualTo player) then {
			[_id, _unit] call FUNC(convertToItem);
		};
	}
] call CBA_fnc_addEventHandler;

[
	QGVAR(dataRemove),
	{
		params ["_data"];
		[_data,"remove"] call FUNC(handleData);
	}
] call CBA_fnc_addEventHandler;

[
	"CAManBase",
	"init",
	{
		params ["_unit"];
		if (!local _unit) exitWith {};
		private _bloodType = [_unit] call FUNC(getBloodType);
		private _bloodInfo = createHashmapFromArray GVAR(defaultBloodInfo);
		_bloodInfo set ["bloodType", _bloodType];
		_bloodInfo set ["owner", _unit];
		_unit setVariable [QGVAR(bloodInfo), _bloodInfo, true];
	},
	true,
	[],
	true
] call CBA_fnc_addClassEventHandler;