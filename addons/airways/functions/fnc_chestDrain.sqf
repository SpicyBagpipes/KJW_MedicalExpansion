#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Applies Chest Drain
 * 
 *  Arguments:
 *  0: Medic <OBJECT>
 *  1: Patient <OBJECT>
 *  2: Body Part <STRING>
 *  3: Treatment <STRING>
 *  4: Item User <OBJECT>
 *  5: Used Item <STRING>
 *  6: Create litter <BOOL>
 *  7: Bandage effectiveness coefficient <NUMBER> (default: 1)
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  [player, cursorObject, "Body", "KJW_MedicalExpansion_ChestDrain"] call KJW_MedicalExpansion_Airways_fnc_chestDrain
 * 
 *  Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname", "", "", "", "_bandageEffectiveness"];

[_patient, "activity", "%1 applied chest drain to patient", [[_medic, false, true] call EFUNC(common,getName)]] call ace_medical_treatment_fnc_addToLog;

[QGVAR(treatPtxLocal), [_patient, _bodyPart, _classname, _bandageEffectiveness], _patient] call CBA_fnc_targetEvent;
