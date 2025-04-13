**111062107_HW2_bonus**
**Environment setting**

**Your code**
.protect
.lib "/usr/cad/cic018.l" tt
.unprotect

.global vdd gnd 
Vdd vdd 0 DC=+1.8v 
Vgnd gnd 0 DC=0v 
**Your design**
* .subckt INV in1 inv_out vdd gnd
* ** Your code **
* mp1 inv_out in1 vdd vdd p_18 w=0.53u l=0.18u
* mn1 inv_out in1 gnd gnd n_18 w=0.53u l=0.18u
* .ends

.subckt hw2_bonus A B C S VDD GND
**Your code**
mp1 NC C vdd vdd p_18 w=2.07u l=0.18u
mn1 NC C gnd gnd n_18 w=1u l=0.18u

mn2 net1 B NC gnd n_18 w=1u l=0.18u
mp2 net1 B C vdd p_18 w=2.07u l=0.18u

mp3 net1 C B vdd p_18 w=2.07u l=0.18u
mn3 net1 NC B gnd n_18 w=1u l=0.18u

mp4 net2 net1 vdd vdd p_18 w=2.07u l=0.18u
mn4 net2 net1 gnd gnd n_18 w=1u l=0.18u

mn5 S A net2 gnd n_18 w=1u l=0.18u
mp5 S A net1 vdd p_18 w=2.07u l=0.18u

mp6 S net1 A vdd p_18 w=2.07u l=0.18u
mn6 S net2 A gnd n_18 w=1u l=0.18u
* Inverters for A, B, and C
* Xinv1 A NA VDD GND INV
* mp1 NA A vdd vdd p_18 w=2.07u l=0.18u
* mn1 NA A gnd gnd n_18 w=1u l=0.18u
* * Xinv2 B NB VDD GND INV
* mp2 NB B vdd vdd p_18 w=2.07u l=0.18u
* mn2 NB B gnd gnd n_18 w=1u l=0.18u
* * Xinv3 C NC VDD GND INV
* mp3 NC C vdd vdd p_18 w=2.07u l=0.18u
* mn3 NC C gnd gnd n_18 w=1u l=0.18u
* * XOR Gate Logic
* * PMOS Network
* mp4    net1    A    vdd    vdd    p_18    w=2.07u     l=0.18u 
* mp5    net2    NA   vdd     vdd    p_18    w=2.07u     l=0.18u 

* mp6    net3    B    net1    vdd    p_18    w=2.07u     l=0.18u 
* mp7    net3    NB    net2    vdd    p_18    w=2.07u     l=0.18u 

* mp8    net4    NB    net1    vdd    p_18    w=2.07u     l=0.18u 
* mp9    net4    B    net2    vdd    p_18    w=2.07u     l=0.18u

* mp10    S    NC    net3    vdd    p_18    w=2.07u     l=0.18u 
* mp11    S    C    net4    vdd    p_18    w=2.07u     l=0.18u
* * NMOS Network
* mn4    net5    A    gnd    gnd    n_18    w=1u    l=0.18u
* mn5    net6    NA    gnd    gnd    n_18    w=1u    l=0.18u

* mn6    net7    B    net5    gnd    n_18    w=1u    l=0.18u
* mn7    net7    NB    net6    gnd    n_18    w=1u    l=0.18u

* mn8    net8    NB    net5    gnd    n_18    w=1u    l=0.18u
* mn9    net8    B    net6    gnd    n_18    w=1u    l=0.18u

* mn10    S    NC    net7    gnd    n_18    w=1u    l=0.18u
* mn11    S    C    net8    gnd    n_18    w=1u    l=0.18u
.ends

**Main circuit**
Xhw2_XOR A B C S VDD GND hw2_bonus
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
********************************************************************************
* **111062107_HW2_bonus**
* **Environment setting**

* **Your code**
* * .protect
* * .lib "/usr/cad/cic018.l" tt
* * .unprotect

* .global vdd gnd 
* Vdd vdd 0 DC=+1.8v 
* Vgnd gnd 0 DC=0v 
* **Your design**
* .subckt hw2_bonus A B C S VDD GND
* **Your code**
* mp1 NC C vdd vdd p_18 w=2.07u l=0.18u
* mn1 NC C gnd gnd n_18 w=1u l=0.18u

* mn2 net1 B NC gnd n_18 w=1u l=0.18u
* mp2 net1 B C vdd p_18 w=2.07u l=0.18u

* mp3 net1 C B vdd p_18 w=2.07u l=0.18u
* mn3 net1 NC B gnd n_18 w=1u l=0.18u

* mp4 net2 net1 vdd vdd p_18 w=2.07u l=0.18u
* mn4 net2 net1 gnd gnd n_18 w=1u l=0.18u

* mn5 S A net2 gnd n_18 w=1u l=0.18u
* mp5 S A net1 vdd p_18 w=2.07u l=0.18u

* mp6 S net1 A vdd p_18 w=2.07u l=0.18u
* mn6 S net2 A gnd n_18 w=1u l=0.18u
* .ends

* **Main circuit**
* * Xhw2_XOR A B C S VDD GND hw2_bonus
* * C1 S GND 0.005p

* * **Input signal**
* * **Your code**
* * Va a GND PULSE(0v 1.8v 2490p 10p 10p 2490p 5n)
* * Vb b GND PULSE(0v 1.8v 4990p 10p 10p 4990p 10n)
* * Vc C GND PULSE(0v 1.8v 9990p 10p 10p 9990p 20n)

* * **Simulation setting**
* * .tran 1p 40n
* * .unprotect
* * .tem 30
* * .option post
* * .op
* * .measure tran power AVG POWER
* * .meas tran Delay1_XOR trig v(A) val=0.9 fall=4
* * +                     targ v(S) val=0.9 fall=3
* * .meas tran Delay2_XOR trig v(A) val=0.9 rise=1
* * +                     targ v(S) val=0.9 rise=1
* * .end