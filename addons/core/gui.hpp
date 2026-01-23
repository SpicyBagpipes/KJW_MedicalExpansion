class RscText;
class RscPicture;

class RscTitles {
	class GVAR(bagSticker) {
		idd = -1;
		onLoad = "uiNamespace setVariable ['KJW_MedicalExpansion_Core_bagSticker', _this #0];";
		onUnload = "uiNamespace setVariable ['KJW_MedicalExpansion_Core_bagSticker', nil];";
		fadeIn = 0.2;
		fadeOut = 0.2;
		duration = 5;
		movingEnable = 0;
		class controls {
			class background: RscPicture {
				idc = 2120;
				text = "\y\kjw_medicalexpansion\addons\core\data\bloodsticker_bag.paa";
				x = QUOTE(30.5 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X);
				y = QUOTE(5 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y);
				w = QUOTE(13.5 * GUI_GRID_CENTER_W);
				h = QUOTE(16 * GUI_GRID_CENTER_H);
			};
			class Volume: RscText {
				idc = 2121;
				text = "<NULL>"; //--- ToDo: Localize;
				x = QUOTE(30.9 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X);
				y = QUOTE(6.4 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y);
				w = QUOTE(3.5 * GUI_GRID_CENTER_W);
				h = QUOTE(2 * GUI_GRID_CENTER_H);
				colorText[] = {0,0,0,1};
				colorBackground[] = {0,0,0,0};
				sizeEx = QUOTE(2 * GUI_GRID_CENTER_H);
				font = "PuristaMedium";
				colorShadow[] = {0,0,0,0};
			};
			class BloodType: Volume {
				idc = 2122;
				text = "<NULL>"; //--- ToDo: Localize;
				x = QUOTE(41 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X);
				y = QUOTE(6.2 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y);
				w = QUOTE(2.5 * GUI_GRID_CENTER_W);
				h = QUOTE(3 * GUI_GRID_CENTER_H);
				sizeEx = QUOTE(3 * GUI_GRID_CENTER_H);
				align = "CENTER";
				style = "0x02";
			};
			class RHFactor: BloodType {
				idc = 2123;
				text = "<NULL>"; //--- ToDo: Localize;
				x = QUOTE(40 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X);
				y = QUOTE(8.56 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y);
				w = QUOTE(3 * GUI_GRID_CENTER_W);
				h = QUOTE(1.5 * GUI_GRID_CENTER_H);
				sizeEx = QUOTE(2 * GUI_GRID_CENTER_H);
			};
		};
	};
};
