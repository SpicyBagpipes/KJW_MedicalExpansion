# Centrifuge

The centrifuge goes hand in hand with the Blood Data feature, and allows Blood Samples taken from units to be processed and approximate (a resolution of 1%) values of the properties conveyed to the user. The centrifuge is incredibly easy to use, exclusively using ACE Interactions, with an addon setting for a time coefficient for those who wish to only make a change to the duration for one mission for example.

The centrifuge by default can only handle 4 samples, with a duration of 10 seconds to process them all. These are able to be changed (and extended for third party centrifuges) via the `KJW_MedicalExpansion_Core_centrifugeMaxLoad` and `KJW_MedicalExpansion_Core_centrifugeDuration` config properties in the centrifuge class itself.

For adding blood properties that will appear in the centrifuge, the `displayName` config property must be set in `KJW_MedicalExpansion >> BloodProperties >> classname >> displayName`, where the classname is the string that will be checked in the hashmap of blood data.
