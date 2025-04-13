** final_project_testcases_settings **

*************************
** Environment setting **
*************************
.tran 0.01n 26n
.option POST
.protect
.lib "/usr/cad/cic018.l" tt
.temp 30
.unprotect

*********************
** Clock Parameter **
*********************
.param    CLK_Period = 2n
.param    CLK_Period_2 = 'CLK_Period/2'
.param    r_time = 1p
.param    f_time = 1p
.param    SupplyV = 1.8v

********************
* voltage setting **
********************
.global vdd gnd
Vvdd vdd 0 DC=+1.8v
Vgnd gnd 0 DC=0v

**************************
*** Simulation setting ***
**************************
Vclk CLK 0 PULSE(0v SupplyV 0 r_time f_time CLK_Period_2 CLK_Period)

Vrst RST 0 PWL 0n SupplyV
+ 'CLK_Period*1.5' SupplyV 'CLK_Period*1.5+f_time' 0v 'CLK_Period*2.5' 0v 'CLK_Period*2.5+r_time' SupplyV
+ 'CLK_Period*6.5' SupplyV 'CLK_Period*6.5+f_time' 0v 'CLK_Period*7.5' 0v 'CLK_Period*7.5+r_time' SupplyV

Vval IN_VAL 0 PWL 0n 0v
+ 'CLK_Period*1' 0v 'CLK_Period*1+f_time' SupplyV 'CLK_Period*5' SupplyV 'CLK_Period*5+r_time' 0v
+ 'CLK_Period*6' 0v 'CLK_Period*6+f_time' SupplyV 'CLK_Period*10' SupplyV 'CLK_Period*10+r_time' 0v

*8 -> 15
VD1 I1 0 PWL 0n 0v
+ 'CLK_Period*1' 0v 'CLK_Period*1+r_time' SupplyV 'CLK_Period*2' SupplyV 'CLK_Period*2+f_time' 0v
+ 'CLK_Period*6' 0v 'CLK_Period*6+r_time' SupplyV 'CLK_Period*10' SupplyV 'CLK_Period*10+f_time' 0v
*2 -> 14
VD2 I2 0 PWL 0n 0v
+ 'CLK_Period*3' 0v 'CLK_Period*3+r_time' SupplyV 'CLK_Period*4' SupplyV 'CLK_Period*4+r_time' 0v
+ 'CLK_Period*6' 0v 'CLK_Period*6+r_time' SupplyV 'CLK_Period*9' SupplyV 'CLK_Period*9+f_time' 0v
*3 -> 13
VD3 I3 0 PWL 0n 0v
+ 'CLK_Period*3' 0v 'CLK_Period*3+r_time' SupplyV 'CLK_Period*5' SupplyV 'CLK_Period*5+f_time' 0v
+ 'CLK_Period*6' 0v 'CLK_Period*6+r_time' SupplyV 'CLK_Period*8' SupplyV 'CLK_Period*8+f_time' 0v
+ 'CLK_Period*9' 0v 'CLK_Period*9+r_time' SupplyV 'CLK_Period*10' SupplyV 'CLK_Period*10+f_time' 0v
*7 -> 12
VD4 I4 0 PWL 0n 0v
+ 'CLK_Period*2' 0v 'CLK_Period*2+r_time' SupplyV 'CLK_Period*5' SupplyV 'CLK_Period*5+r_time' 0v
+ 'CLK_Period*6' 0v 'CLK_Period*6+r_time' SupplyV 'CLK_Period*8' SupplyV 'CLK_Period*8+f_time' 0v

*******************
*** Measurement ***
*******************
.measure TRAN td 
+ TRIG V(Xdcim.ii1) VAL=0.9 RISE=1
+ TARG V(Xdcim.P10)  VAL=0.9 RISE=1

.measure TRAN pwr AVG POWER