#include "script_component.hpp"
/*
 * Author: Glowbal, SilentSpike, mharis001
 * Updates the body image for given target.
 * Editor: KJW
 *
 * Arguments:
 * 0: Body image controls group <CONTROL>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, _target] call ace_medical_gui_fnc_updateBodyImage
 *
 * Public: No
 */

params ["_ctrlGroup", "_target"];

// Get tourniquets, damage, and blood loss for target
private _tourniquets = GET_TOURNIQUETS(_target);
private _fractures = GET_FRACTURES(_target);
private _IVs = _target getVariable ["KJW_MedicalExpansion_Core_IV", [0, 0, 0, 0, 0, 0]];
private _bodyPartDamage = _target getVariable [QEGVAR(medical,bodyPartDamage), [0, 0, 0, 0, 0, 0]];
private _bodyPartBloodLoss = [0, 0, 0, 0, 0, 0];

{
    _x params ["", "_bodyPartN", "_amountOf", "_bleeding"];
    _bodyPartBloodLoss set [_bodyPartN, (_bodyPartBloodLoss select _bodyPartN) + (_bleeding * _amountOf)];
} forEach GET_OPEN_WOUNDS(_target);

{
    private _bodyPartIndex = _forEachIndex;
	private _vars = KJW_MedicalExpansion_Core_UIElements get _x;
	_vars params ["_bodyPartIDC", ["_subElements", []]];
    
    {
        private _idc = _x get "idc";
        private _condition = _x get "condition";
        private _result = _x get "result";
        private _showElement = [_tourniquets, _fractures, _IVs, _bodyPartIndex] call _condition;
        private _ctrl = _ctrlGroup controlsGroupCtrl _idc;
        _ctrl ctrlShow _showElement;
        [_tourniquets, _fractures, _IVs, _bodyPartIndex, _showElement, _ctrl] call _result;
    } forEach _subElements;

    // Update body part color based on blood loss and damage
    private _bloodLoss = _bodyPartBloodLoss select _forEachIndex;
    private _bodyPartColor = if (_bloodLoss > 0) then {
        [_bloodLoss] call FUNC(bloodLossToRGBA);
    } else {
        private _damage = _bodyPartDamage select _forEachIndex;
        [_damage] call FUNC(damageToRGBA);
    };

    private _ctrlBodyPart = _ctrlGroup controlsGroupCtrl _bodyPartIDC;
    _ctrlBodyPart ctrlSetTextColor _bodyPartColor;
} forEach ["Head", "Torso", "ArmLeft", "ArmRight", "LegLeft", "LegRight"];

/*[
    [IDC_BODY_HEAD],
    [IDC_BODY_TORSO],
    [IDC_BODY_ARMLEFT,  IDC_BODY_ARMLEFT_T,  IDC_BODY_ARMLEFT_B, IDC_BODY_ARMLEFT_IV],
    [IDC_BODY_ARMRIGHT, IDC_BODY_ARMRIGHT_T, IDC_BODY_ARMRIGHT_B, IDC_BODY_ARMRIGHT_IV],
    [IDC_BODY_LEGLEFT,  IDC_BODY_LEGLEFT_T,  IDC_BODY_LEGLEFT_B, IDC_BODY_LEGLEFT_IV],
    [IDC_BODY_LEGRIGHT, IDC_BODY_LEGRIGHT_T, IDC_BODY_LEGRIGHT_B, IDC_BODY_LEGRIGHT_IV]
];*/