**111062107_HW2_XOR**
**Environment setting**

**Your code**
.protect
.lib "/usr/cad/cic018.l" tt
.unprotect

.include 'hw2_XOR.pex.netlist'

.global vdd gnd 
Vdd vdd 0 DC=+1.8v 
Vgnd gnd 0 DC=0v 
**Your design**

**Main circuit**
Xhw2_XOR A B C GND VDD S HW2_XOR
C1 S GND 0.005p

**Input signal**
**Your code**
Va a GND PULSE(0v 1.8v 2490p 10p 10p 2490p 5n)
Vb b GND PULSE(0v 1.8v 4990p 10p 10p 4990p 10n)
Vc C GND PULSE(0v 1.8v 9990p 10p 10p 9990p 20n)

**Simulation setting**
.tran 1p 40n
.unprotect
.tem 30
.option post
.op
.measure tran power AVG POWER
.meas tran Delay1_XOR trig v(A) val=0.9 fall=4
+                     targ v(S) val=0.9 fall=3
.meas tran Delay2_XOR trig v(A) val=0.9 rise=1
+                     targ v(S) val=0.9 rise=1
.end