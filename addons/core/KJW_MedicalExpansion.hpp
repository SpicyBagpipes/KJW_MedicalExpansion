class MOD_NAME {
	class None {};
	class IVs: None {
		class 0 {
			UNUSED = 1;
		};
		class 1: 0 {
			displayName = "IV";
			displayStringApplied = "IV Applied";
			displayColourApplied[] = {0.62,0.361,0.929,1};
			handlingAmount = 1;
		};
		class 2: 0 {
			displayName = "IO";
			displayStringApplied = "IO Applied";
			displayColourApplied[] = {0.62,0.561,0.929,1};
			handlingAmount = 2;
		};
	};
	class BloodProperties: None {
		class rbc: None {
			displayName = "Red Blood Cells";
		};
		class wbc: None {
			displayName = "White Blood Cells";
		};
		class bloodType: None {
			displayName = "Blood Type";
		};
		class platelet: None {
			displayName = "Platelets";
		};
		class flu: None {
			displayName = "Influenza";
		};
		class cholera: None {
			displayName = "Cholera";
		};
		class aids: None {
			displayName = "AIDS";
		};
		class cold: None {
			displayName = "Common Cold";
		};
		class ebola: None {
			displayName = "Ebola";
		};
		class anthrax: None {
			displayName = "Anthrax";
		};
		class malaria: None {
			displayName = "Malaria";
		};
		class covid: None {
			displayName = "COVID-19";
		};
		class plague: None {
			displayName = "Bubonic Plague";
		};
		class vaccine_flu: None {
			displayName = "Influenza Vaccine";
		};
		class vaccine_cholera: None {
			displayName = "Cholera Vaccine";
		};
		class vaccine_aids: None {
			displayName = "AIDS Vaccine";
		};
		class vaccine_cold: None {
			displayName = "Common Cold Vaccine";
		};
		class vaccine_ebola: None {
			displayName = "Ebola Vaccine";
		};
		class vaccine_anthrax: None {
			displayName = "Anthrax Vaccine";
		};
		class vaccine_malaria: None {
			displayName = "Malaria Vaccine";
		};
		class vaccine_covid: None {
			displayName = "COVID-19 Vaccine";
		};
		class vaccine_plague: None {
			displayName = "Bubonic Plague Vaccine";
		};
	};
	class CentrifugeMedications: None {
		class Morphine: None {
			displayName = "Morphine";
			doseMultiplier = 5;
			doseMeasurement = "mg";
			showInCentrifuge = 1;
		};
		class Epinephrine: Morphine {
			displayName = "Epinephrine";
			doseMultiplier = 0.3;
		};
	};
};