# PPE

Whilst serving no function in Medical Expansion on its own, PPE is handled within ME:C. This is then used by other modules, such as Radiate, Diseases and Toxins, and also by third parties.\
An addon option is provided to set a PPE Threshold as well as a PPE Effectiveness Coefficient, with values over the threshold **blocking** negative effects.

PPE is able to have requirements in order to work properly, which is particularly useful for assets such as the CUR and SCBA from the base game, which will have hoses automatically shown/hidden based on the used facewear, with the facewear swapped to no filter variants.\
\
Compatibility is done for:\
\- Base game\
\- Global Mobilization CDLC\
\- USP Facewear\
\- M40 mod\
\- FM12 mod\
\- PMK1 mod

In order to use the above, the following config variables should be set:\
\- `KJW_MedicalExpansion_PPE_PPE = 1` (Maximum Protection)\
\- `KJW_MedicalExpansion_PPE_Requirements[] = {}` (Array of classnames, can be any items)
