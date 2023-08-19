# Coding Guidelines
---
## FAQ:
#### Q: Should this mod have compatibility with KAM?
*A:*  **No.** This mod is not designed to run with KAM, and may in the future even block KAM from loading/not load if KAM is loaded. This is so that breaking changes to ACE are not required to be compatible with KAM. However, if you make changes to ACE that KAM may benefit from that do not suit vanilla ACE, please do submit a PR to KAM too.

#### Q: What if I want to create a new module?
*A:* Please refer to KJW or one of his minions before doing so. Modules must be properly planned with a wide feature set that is relevant to the module.

#### Q: Do I need to cite sources?
*A:* For obscure or difficult to verify facts, yes. Do not create functionality that is not evidenced by papers and/or **evidence** of real world incidents.

---

## Scripting Conventions
### Scheduler:
The scheduler is not to be used aside from any extreme edge cases in which it is required. If you do not know how to script without using `spawn`, it is recommended you learn how to use [CBA's functions set](https://cbateam.github.io/CBA_A3/docs/index/Functions.html). See more about reasoning and such [here](https://ace3.acemod.org/wiki/development/coding-guidelines.html#8-performance-considerations).

### Variables:
All local variables shall be prefixed with `private` unless justification can be provided for the contrary. Similarly, undescriptive variable names are not permitted. Use `_firstOption` instead of `_1`.

---

## Macro usage:
*If you are familiar with ACE/CBA's macro usage you can safely ignore this section.*
Wherever a relevant macro can be used, it must be. This is to both reduce the risk of human error and to ensure uniformity across all modules. Macros are:
### General Defines
| Macro | Result |
|-------|--------|
|MODNAME|KJW_MedicalExpansion|
|MODNAME_BEAUTIFIED|KJW's Medical Expansion|
|COMPONENT|ModuleName|
|COMPONENT_GENERAL|KJW_MedicalExpansion_ModuleName|

### General Macros
| Macro | Result |
|-------|--------|
|QUOTE(var)|"var"|
|QQUOTE(var)|""var""|
|GVAR(var)|KJW_MedicalExpansion_ModuleName_var|
|QGVAR(var)|"KJW_MedicalExpansion_ModuleName_var"|
|QQGVAR(var)|""KJW_MedicalExpansion_ModuleName_var""|
|EGVAR(component,var)|KJW_MedicalExpansion_component_var|
|QEGVAR(component,var)|"KJW_MedicalExpansion_component_var"|
|QQEGVAR(component,var)|""KJW_MedicalExpansion_component_var""|

### Function Macros
| Macro | Result |
|-------|--------|
|FUNC(function)|KJW_MedicalExpansion_Module_fnc_function|
|QFUNC(function)|"KJW_MedicalExpansion_Module_fnc_function"|
|QQFUNC(function)|""KJW_MedicalExpansion_Module_fnc_function""|
|EFUNC(component,function)|KJW_MedicalExpansion_component_fnc_function|
|QEFUNC(component,function)|"KJW_MedicalExpansion_component_fnc_function"|
|QQEFUNC(component,function)|""KJW_MedicalExpansion_component_fnc_function""|

### Filepath Macros
| Macro | Result |
|-------|--------|
|PATHTOF(data\balls.paa)|\y\KJW_MedicalExpansion\addons\module\data\balls.paa|
|QPATHTOF(data\balls.paa)|"\y\KJW_MedicalExpansion\addons\module\data\balls.paa"|
|PATHTOEF(core,data\balls.paa)|\y\KJW_MedicalExpansion\addons\\**core**\data\balls.paa|
|QPATHTOEF(core,data\balls.paa)|"\y\KJW_MedicalExpansion\addons\\**core**\data\balls.paa"|

---

## Creating a new function:
This will detail steps to do to create a new function.
1. Create a file in the format of `fnc_[functionname].sqf`
1. Add the function header to the top of the file. See template below.
1. Add `FUNCTION_DECLARE(functionname)` to the `CfgFunctions` of the `config.cpp` of the module.
<details>
<summary>Function Header Template</summary>

```sqf
#include "script_component.hpp"
/*
 *  Author: Yourname
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
 *  [[bob, ted], false] call KJW_MedicalExpansion_Core_fnc_myfunction
 * 
 *  Public: No
 */
```
</details>


---

## Creating a new module:
This will detail steps to do to create a new module. Do not do so without discussing with KJW and the rest of the contributors who work on the project.
1. Copy an existing module, delete all function and data files. Do not delete `script_component.hpp` files.
1. Rename folder to new module name.
1. Update `script_component.hpp` in accordance with new module name. Only first two lines need modification.
1. Update function headers in `XEH_PostInit.sqf` and `XEH_PreInit.sqf` files.
1. Update CfgFunctions class to new module name. Macros should **NOT** be used in CfgFunctions classnames.