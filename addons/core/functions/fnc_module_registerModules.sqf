#include "script_component.hpp"
/*
 *  Author: KJW
 * 
 *  Adds zeus modules for ZEN
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_Radiate_Core_fnc_module_registerModules
 * 
 *  Public: No
 */

// This does throw script errors on ZEN's side. I'm not quite sure why.


[
    "KJW's Medical Expansion",
    "Leave Body Respawn",
    {
        params ["_pos","_obj"];
        if (!(_obj in (allPlayers - entities "HeadlessClient_F"))) exitWith {};
        [QGVAR(leaveBodyRespawn), [], _obj] call CBA_fnc_targetEvent;
    }
] call zen_custom_modules_fnc_register;
