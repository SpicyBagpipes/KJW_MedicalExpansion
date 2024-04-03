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
		[{
			params["_display"];
			private _buttonRespawn = _display displayCtrl ([104, 1010] select isMultiplayer);
			uiNamespace setVariable ["KJW_RespawnDisplay", _display];
			_buttonRespawn ctrlSetEventHandler ["ButtonClick", toString { 
				private _unconscious = lifeState player == "INCAPACITATED";
				private _display = uiNamespace getVariable ["KJW_RespawnDisplay",displayNull];
				if (_unconscious && GVAR(leaveBodyRespawn)) then {
					[QGVAR(leaveBodyRespawn), [], _obj] call CBA_fnc_targetEvent;
				} else {
					player setDamage 1;
					_display closeDisplay 2;
				};
			}]; 
		},[_display],0.1] call CBA_fnc_waitAndExecute; 
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
	QGVAR(leaveBodyRespawn),
	{
		private _loadout = [player] call CBA_fnc_getLoadout;
		private _type = typeOf player;
		private _group = group player;
		if (!GVAR(leaveBodyRespawnJoinGroup)) then {
			[player] joinSilent grpNull;
		};
		private _unit = _group createUnit [_type, [0,0,0], [], 0, "NONE"];
		[_unit, _loadout] call CBA_fnc_setLoadout;
		selectPlayer _unit;
		_unit setDamage 1;
		deleteVehicle _unit;
		_display closeDisplay 2;
		if (GVAR(leaveBodyRespawnNotify)) then {
			[QGVAR(leaveBodyRespawnNotification),[]] call CBA_fnc_globalEvent;
		};
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
		_unit setVariable [QGVAR(bloodInfo), _bloodInfo, true];
	},
	true,
	[],
	true
] call CBA_fnc_addClassEventHandler;

[
	QGVAR(leaveBodyRespawnNotification),
	{
		params [];
		systemChat "They have ascended to a higher plane of being...";
	}
] call CBA_fnc_addEventHandler;

if (GVAR(KAMLoaded) && GVAR(kamOverrideBloodGroup)) then {
	[
		"kat_circulation_setPreferredBloodType",
		{
			params ["_unit"];
			[{params ["_unit"]; [_unit] call FUNC(getBloodType)},[_unit],0.1] call CBA_fnc_waitAndExecute;
		}
	] call CBA_fnc_addEventHandler;
};

[
	"ace_medical_treatment_fullHealLocal",
	{
		params ["_unit"];
		private _bloodType = [_unit] call FUNC(getBloodType);
		private _bloodInfo = createHashmapFromArray GVAR(defaultBloodInfo);
		_bloodInfo set ["bloodType", _bloodType];
		_unit setVariable [QGVAR(bloodInfo), _bloodInfo, true];
	}
] call CBA_fnc_addEventHandler;