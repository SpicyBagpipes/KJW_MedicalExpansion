class CfgVehicles {
	class Items_base_F; 
    class KJW_Centrifuge_F : Items_base_F
    {
		author = "Marcie & Jenna";
        displayName = "Centrifuge";
		GVAR(centrifugeMaxLoad) = 4;
		GVAR(centrifugeDuration) = 10;
		editorCategory = "EdCat_Things";
		editorSubcategory = "EdSubcat_Medicine";
        scope = 2;
		model = QPATHTOF(data\centrifuge\centrifuge.p3d);
        armor = 25;
        ace_dragging_canCarry = 1;
        hiddenSelections[] = {"body", "controls", "vials"};
        hiddenSelectionsTextures[] = {QPATHTOF(data\centrifuge\Centrifuge_co.paa),QPATHTOF(data\centrifuge\ControlPanel_co.paa),QPATHTOF(data\centrifuge\Vial_co.paa)};
        hiddenSelectionsMaterials[] = {QPATHTOF(data\centrifuge\Centrifuge.rvmat),QPATHTOF(data\centrifuge\ControlPanel.rvmat),QPATHTOF(data\centrifuge\Vial.rvmat)};
        class AnimationSources
		{
            class lid_source
            {
                source = "user"; // "user" = custom source = not controlled by some engine value
				initPhase = 1; // Initial value of animations based on this source
				animPeriod = 1; // Coefficient for duration of change of this animation
				sound = "GenericDoorsSound"; // Selects sound class from CfgAnimationSourceSounds that is going to be used for sounds of doors
            };
        };
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