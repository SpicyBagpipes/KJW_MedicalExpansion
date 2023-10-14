class CfgVehicles {
	class Box_C_UAV_06_F;
	class KJW_Centrifuge: Box_C_UAV_06_F {
		displayName = "Centrifuge";
		GVAR(centrifugeMaxLoad) = 6;
		GVAR(centrifugeDuration) = 5;
		class ACE_Actions {
			class ACE_MainActions {
				condition = "true";
				displayName = "Interactions";
				distance = 4;
				position = "";
				selection = "";
				class LoadCentrifuge {
					displayName = "Insert Sample";
					condition = QUOTE(_this call FUNC(canLoadCentrifuge));
					exceptions[] = {"isNotInside","isNotSwimming"};
					distance = 4;
					insertChildren = QUOTE(_this call FUNC(addCentrifugeLoadActions));
				};
				class CentrifugeInventory: LoadCentrifuge {
					displayName = "Loaded Samples";
					condition = QUOTE(_this call FUNC(centrifugeHasLoad));
					insertChildren = QUOTE(_this call FUNC(addCentrifugeInventoryActions));
				};
				class TurnOnCentrifuge {
					displayName = "Turn On";
					condition = QUOTE(_this call FUNC(canSwitchOnCentrifuge));
					exceptions[] = {"isNotInside","isNotSwimming"};
					distance = 4;
					statement = QUOTE(_this call FUNC(switchOnCentrifuge));
				};
				class TurnOffCentrifuge: TurnOnCentrifuge {
					displayName = "Turn Off";
					condition = QUOTE(_this call FUNC(canSwitchOffCentrifuge));
					statement = QUOTE(_this call FUNC(switchOffCentrifuge));
				};
			};
		};
	};
};