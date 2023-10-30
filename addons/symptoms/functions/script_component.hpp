#include "..\script_component.hpp"

#define LINKEVENT(symp) [\
	QGVAR(symp),\
	FUNC(symp)\
] call CBA_fnc_addEventHandler;