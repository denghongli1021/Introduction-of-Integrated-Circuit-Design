** DCIM **
** Environment setting **

**********************************************
*** Don't modify the pin name in this file ***
**********************************************

*****************
*** call cell ***
*****************
Xdcim I1 I2 I3 I4 IN_VAL CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 OUT_VAL DCIM

******************
*** DCIM block ***
******************
.subckt DCIM I1 I2 I3 I4 IN_VAL CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 OUT_VAL

** Your code **

Xcontrol_in I1 I2 I3 I4 CLK IN_VAL ii1 ii2 ii3 ii4 CON_IN
Xcontrol_out1 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 CON_OUT
Xcontrol_out2 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 CLK RST O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 CON_OUT
.ends

************************
*** input controller ***
************************
.subckt CON_IN I1 I2 I3 I4 CLK IN_VAL ii1 ii2 ii3 ii4 
*** Your code ***
.ends

*************************
*** output controller ***
*************************
.subckt CON_OUT P0 P1 P2 P3 P4 P5 P6 P7 P8 P9 CLK RST O0 O1 O2 O3 O4 O5 O6 O7 O8 O9
*** Your code ***
.ends

*******************
*** Your subckt ***
*******************