# Additional Detail

Radiation is a complex topic and has tons of detail that I simply cannot put into one mod. I have gameified it, with the default properties as follows for each type of radiation.

```sqf
//["_maxDistance", "_attenuation", "_ionisingPower"]
[
    "alpha",
    [1, 1, 10]
],
[
    "beta",
    [5, 2, 1]
],
[
    "gamma",
    [10000, 1000, 0.001]
],
[
    "cmbr",
    [-1, -1, 0]
],
[
    "irradiated",
    [1000, 1000, 0.1]
]
```

The mod _is_ capable of having higher fidelity radiation, with the potential for element-specific radiation properties, as in the real world!
