#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001, Cplhardcore
 * Local callback for administering an IV bag to a patient.
 * Editor: KJW
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Treatment <STRING>
 * 3: Medic <OBJECT>
 * 4: Item User <OBJECT>
 * 5: Used item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "RightArm", "BloodIV", player, player, "ACE_BloodIV"] call ace_medical_treatment_fnc_ivBagLocal
 *
 * Public: No
 */

params ["_patient", "_bodyPart", "_treatment", "_medic", "_itemUser", "_item", "_selectedFluid"];

// Exit if patient has max blood volume
private _bloodVolume = GET_BLOOD_VOLUME(_patient);
if (_bloodVolume >= DEFAULT_BLOOD_VOLUME) exitWith {
    // Return the bag if patient is topped up on blood
    if (_medic call EFUNC(common,isPlayer) || {missionNamespace getVariable [QEGVAR(medical_ai,requireItems), 0] > 0}) then {
        [_itemUser, _item] call EFUNC(common,addToInventory);
    };
};

private _partIndex = ALL_BODY_PARTS find toLowerANSI _bodyPart;

//////// BEGIN EDITS
// Get blood data from fluid bag.
private _bloodData = createHashmap;
if (!(isNil "_selectedFluid")) then {
	_bloodData = KJW_MedicalExpansion_Core_FluidData get _selectedFluid;
	_bloodData = [_selectedFluid, _bloodData#1];
} else {
	if (!("saline" in _classname)) then {
		_bloodData = [_classname, createHashmapFromArray [["RBC",24],["WBC",24],["Platelet",24]]];
	};
};
//////// END EDITS

// Get attributes for the used IV
private _defaultConfig = configFile >> QUOTE(ADDON) >> "IV";
private _ivConfig = _defaultConfig >> _treatment;

private _volume   = GET_NUMBER(_ivConfig >> "volume",getNumber (_defaultConfig >> "volume"));
private _type     = GET_STRING(_ivConfig >> "type",getText (_defaultConfig >> "type"));
private _rateCoef = GET_NUMBER(_ivConfig >> "rateCoef",getNumber (_defaultConfig >> "rateCoef"));

// Add IV bag to patient's ivBags array
private _ivBags = _patient getVariable [QEGVAR(medical,ivBags), []];
_ivBags pushBack [_volume, _type, _partIndex, _treatment, _rateCoef, _item, _bloodData]; // EDIT HERE
_patient setVariable [QEGVAR(medical,ivBags), _ivBags, true];