#include "XEH_PREP.sqf"
/*
 *  Author: KJW
 * 
 *  Handles preinit
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_MedicalExpansion_Core_XEH_PreInit
 * 
 *  Public: No
 */

call FUNC(addSettings);

GVAR(KAMLoaded) = isClass (configFile >> "CfgPatches" >> "kat_main");
