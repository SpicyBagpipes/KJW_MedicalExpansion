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
			[QGVAR(dataAdd),[[_bloodBag, _bloodInfo], _medic, _unit]] call CBA_fnc_globalEvent;
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
					[QGVAR(leaveBodyRespawn), [], player] call CBA_fnc_targetEvent;
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
		params ["_data","_medic", "_unit"];
		private _id = [_data,"add",_unit] call FUNC(handleData);
		if (_medic isEqualTo player) then {
			[_id, _medic] call FUNC(convertToItem);
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
			_group = createGroup side _group;
		};
		if (GVAR(leaveBodyRespawnComatose)) then {
			[player, true, 1e10] call ace_medical_fnc_setUnconscious;
		};
		private _unit = _group createUnit [_type, [0,0,0], [], 0, "NONE"];
		[_unit, _loadout] call CBA_fnc_setLoadout;
		selectPlayer _unit;
		_unit setDamage 1;
		deleteVehicle _unit;
		if (GVAR(leaveBodyRespawnNotify)) then {
			[QGVAR(leaveBodyRespawnNotification),[player]] call CBA_fnc_globalEvent;
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
		params [_unit];
		private _name = _unit getVariable ["ace_name","A lost soul"];
		private _str = format ["%1 has ascended to a higher plane of being...",_name];
		systemChat _str;
	}
] call CBA_fnc_addEventHandler;

if (GVAR(KAMLoaded) && GVAR(kamOverrideBloodGroup)) then {
	[
		"kat_circulation_setPreferredBloodType",
		{
			params ["_unit"];
			[_unit] call FUNC(getBloodType);
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

player addEventHandler ["Respawn",{
	params ["_unit"];
	private _bloodType = [_unit] call FUNC(getBloodType);
	private _bloodInfo = createHashmapFromArray GVAR(defaultBloodInfo);
	_bloodInfo set ["bloodType", _bloodType];
	_unit setVariable [QGVAR(bloodInfo), _bloodInfo, true];
}];

[
	"ace_medical_gui_updateInjuryListGeneral",
	{
		if (GVAR(KAMLoaded)) exitWith {};
		params ["_ctrl", "_target", "_selectionN", "_entries"];
		private _nonissueColor = [1, 1, 1, 0.33];
		private _IVs = _target getVariable ["KJW_MedicalExpansion_Core_IV",[0,0,0,0,0,0]];
		private _cannula = _IVs#_selectionN;

		private _cannulationString = getText (configFile >> "KJW_MedicalExpansion" >> "IVs" >> str _cannula >> "displayStringApplied");
		private _cannulationColour = getArray (configFile >> "KJW_MedicalExpansion" >> "IVs" >> str _cannula >> "displayColourApplied");
		_cannulationColour = if (_cannulationColour isEqualTo []) then {[0.62,0.361,0.929,1]} else {_cannulationColour};
		if (_cannula isNotEqualTo 0) then {
			if (_cannulationString isEqualTo "") then {
				_entries pushBack ["IV Applied", _cannulationColour];
			} else {
				_entries pushBack [_cannulationString, _cannulationColour];
			};
		} else {
			_entries pushBack ["No catheter", _nonissueColor];
		};
	}
] call CBA_fnc_addEventHandler;

[
	"ace_medical_consumedIVs",
	{
		params ["_unit", "_consumedIVs"];

		if (_consumedIVs isEqualTo [] || !local _unit) exitWith {};
		
		private _unitData = _unit getVariable ["KJW_MedicalExpansion_Core_BloodInfo", createHashmapFromArray GVAR(defaultBloodInfo)];

		{
			_x params ["_fluidType", "_ivTreatmentClassName", "_bagChangeInLiters", "_item"];

			private _relevantData = GVAR(fluidData) getOrDefault [_item,["",createHashmapFromArray GVAR(defaultBloodInfo)]];
			private _bloodDataHash = _relevantData#1;

			private _bloodType = _bloodDataHash get "bloodType";
            private _isCompatible = [_unit getVariable QGVAR(bloodType),_bloodType] call FUNC(checkBloodTypeCompatibility);

			if (!_isCompatible && GVAR(bloodIncompatibilityEnabled)) then {
                _bagChangeInLiters = _bagChangeInLiters * -1; // This will now do nothing and needs to be moved to its own function
                private _roll = random 1;
                if (_roll < 0.2) then {
                    private _bodyPart = selectRandom ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"];
                    [_unit, 0.025, _bodyPart, "KJW_Bruise"] call ace_medical_fnc_addDamageToUnit;
                };
            };

			{
				private _data = _bloodDataHash getOrDefault [_x, 0, true];
				private _dataChange = (_bagChangeInLiters min _data)/10;
				private _dataRemaining = _data - _dataChange;
				_bloodDataHash set [_x, _dataRemaining];
				private _value = _unitData getOrDefault [_x, 0, true];
				_value = _value + _dataChange;
				_unitData set [_x, _value];
			} forEach GVAR(bloodTransmissiveInfo);

			/* No longer functional
			if (_bagVolumeRemaining < 0.01) then {
				["KJW_MedicalExpansion_Core_dataRemove", [_bloodData]] call CBA_fnc_globalEvent;
			};
			*/

		} forEach _consumedIVs;
	}
] call CBA_fnc_addEventHandler;