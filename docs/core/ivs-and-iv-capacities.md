# IVs and IV Capacities

Medical Expansion offers IV lines with the ability to toggle the maximum capacities of them. IV lines must be set before administering certain medications along with transfusions, with ME:C IV lines being replaced with KAM's IVs if KAM is loaded. All of the functions are built with KAM compatibility in mind, and will function the exact same.\
\
IV Capacities are set via config (KJW\_MedicalExpansion >> IVs >> 1), with the `handlingAmount` able to be modified in order to allow more transfusions to take place at once through the same IV. The display string in the medical menu can also be changed with this, however will not be compatible with KAM. The IV type should be set via a number in the `KJW_MedicalExpansion_IVType` property. The default value used is 1 (A regular IV which can only handle one fluid through it at once).
