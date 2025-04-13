** 111062107_HW1 **
** Environment setting **
.protect
.lib "/usr/cad/cic018.l" tt
.unprotect

.global vdd gnd
Vdd vdd 0 DC=+3.3v
Vgnd gnd 0 DC=0v
*************************
* Your code *
*************************

*** Inverter ***
.subckt INV in1 inv_out vdd vss
mp1    vdd    in1    inv_out    vdd    p_18    w=0.5u     l=0.18u     
mn1    inv_out    in1    vss    vss    n_18    w=0.25u    l=0.18u
.ends

*** OR Gate ***
.subckt OR2 in2 in3 OR_out vdd vss
mp1    vdd    in2    OR_out    vdd    p_18    w=0.5u     l=0.18u
mp2    vdd    in3    OR_out    vdd    p_18    w=0.5u     l=0.18u
mn1    OR_out    in2    net1    vss    n_18    w=0.25u    l=0.18u
mn2    net1    in3    vss      vss    n_18    w=0.25u    l=0.18u
.ends

*** AND Gate ***
.subckt AND2 in4 in5 AND_out vdd vss
mp1    vdd    in4    net2    vdd    p_18    w=0.5u     l=0.18u
mp2    net2   in5    AND_out vdd    p_18    w=0.5u     l=0.18u
mn1    AND_out  in4    vss    vss    n_18    w=0.25u    l=0.18u
mn2    AND_out  in5    vss    vss    n_18    w=0.25u    l=0.18u
.ends

*** Logic Function ***
.subckt logic_function a b c d out vdd vss
* First term: d(b + c)
XNB b nb vdd vss INV
XAND1 nb c nb_c vdd vss AND2
XAND2 d nb_c first vdd vss AND2

* Second term: c(b + a)
XOR2 nb a nb_a vdd vss OR2
XAND2 c nb_a second vdd vss AND2

* Final OR gate to combine both terms
XOR3 first second out vdd vss OR2
.ends

Xlogic a b c d out vdd vss logic_function

.tran 0.01n 130n
.unprotect
.tem 30
.option post
.op
* *** Testbench for Logic Function ***
* Vdd vdd 0 1.8
* Vss vss 0 0

* * Define the logic function
* Xlogic a b c d out vdd vss logic_function

* * Input combinations: (a, b, c, d) = (0,0,0,0) to (1,1,1,1)

* * Combination 1: (0, 0, 0, 0)
* Vin_a a 0 0
* Vin_b b 0 0
* Vin_c c 0 0
* Vin_d d 0 0
* .tran 1n 100n

* * Combination 2: (0, 0, 0, 1)
* Vin_a a 0 0
* Vin_b b 0 0
* Vin_c c 0 0
* Vin_d d 0 1.8
* .tran 1n 100n

* * Combination 3: (0, 0, 1, 0)
* Vin_a a 0 0
* Vin_b b 0 0
* Vin_c c 0 1.8
* Vin_d d 0 0
* .tran 1n 100n

* * Combination 4: (0, 0, 1, 1)
* Vin_a a 0 0
* Vin_b b 0 0
* Vin_c c 0 1.8
* Vin_d d 0 1.8
* .tran 1n 100n

* * Repeat the above for all 16 combinations of (a, b, c, d)

* * Final input combination: (1, 1, 1, 1)
* Vin_a a 0 1.8
* Vin_b b 0 1.8
* Vin_c c 0 1.8
* Vin_d d 0 1.8
* .tran 1n 100n

* Run the transient analysis
.end
