# Radiation Types

ME:R adds multiple core radiation types, with the potential for users to add their own should they desire even more fidelity and realism -- you are strongly encouraged to research it! Radiation is an interesting topic and this mod only touches the first atom of the iceberg!

The radiation types added by ME:R are as follows:\
\- Alpha\
\- Beta (There is no distinction between B+ or B-, research it and add it yourself, it's easy!)\
\- Gamma\
\- CMBR (Background radiation)\
\- Irradiated\
These types are then set as the `KJW_Radiate_Core_radiationType` variable. By default, the 3DEN attributes only allow you to set this variable as Alpha, Beta or Gamma. Any modded types should be set manually, and will not appear. Similarly, it is **strongly recommended** that you do not modify CMBR, as this may interfere with how the background radiation functions and may result in it becoming unplayable.

These are found in the `KJW_Radiate_Core_radiationProperties` hashmap, with the values in the array contained within each key using the format of `["_maxDistance", "_attenuation", "_ionisingPower"]`. Attenuation is simply the number of surfaces the radiation is able to pass through; this is simplified from the real world. Max Distance is how far the radiation type is able to travel through air/materials in total, and Ionising Power is how much "damage" the radiation type does.&#x20;
