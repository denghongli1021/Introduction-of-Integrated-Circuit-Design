** 111062107_HW1 **
** Environment setting **
.protect
.lib "/usr/cad/cic018.l" tt
.unprotect

.global vdd vss 
Vdd vdd 0 DC=+1.8v 
Vgnd vss 0 DC=0v 
************************* 
* Your code *
*************************
*** Inverter ***
.subckt INV in1 inv_out vdd vss
mp1    vdd    in1    inv_out    vdd    p_18    w=0.5u     l=0.18u     
mn1    inv_out    in1    vss    vss    n_18    w=0.25u    l=0.18u
.ends

*** NAND Gate ***
.subckt NAND2 in1 in2 NNAD_out vdd vss
mp1    vdd    in1    NNAD_out    vdd    p_18    w=0.5u     l=0.18u
mp2    vdd    in2    NNAD_out    vdd    p_18    w=0.5u     l=0.18u
mn1    NNAD_out    in1    net1    vss    n_18    w=0.25u    l=0.18u
mn2    net1    in2    vss      vss    n_18    w=0.25u    l=0.18u
.ends
*** AND Gate ***
.subckt AND2 in2 in3 and_out vdd vss
XNAND in2 in3 net_nand vdd vss NAND2
XINV net_nand AND_out vdd vss INV
.ends

*** NOR Gate ***
.subckt NOR2 in1 in2 NOR_out vdd vss
mp1    vdd    in1    net2    vdd    p_18    w=0.5u     l=0.18u
mp2    net2   in2    NOR_out vdd    p_18    w=0.5u     l=0.18u
mn1    NOR_out  in1    vss    vss    n_18    w=0.25u    l=0.18u
mn2    NOR_out  in2    vss    vss    n_18    w=0.25u    l=0.18u
.ends
*** OR Gate ***
.subckt OR2 in4 in5 or_out vdd vss
XNOR in4 in5 net_nor vdd vss NOR2
XINV net_nor OR_out vdd vss INV
.ends

*** Logic Function: out = d(!b * c) + c(!b + a) *** 
.subckt logic_function a b c d out vdd vss 
* Invert b to get !b
XINB b nb vdd vss INV 
* First term: d(!b * c)
XAND1 nb c nb_A_c vdd vss AND2 
XAND2 d nb_A_c first vdd vss AND2 
* Second term: c(!b + a)
XOR1 nb a nb_O_a vdd vss OR2 
XAND3 c nb_O_a second vdd vss AND2 
* Final OR gate to combine the two terms: d(!b * c) + c(!b + a)
XOR2 first second out vdd vss OR2
.ends


* Logic function instantiation
Xlogic a b c d out vdd vss logic_function
*** Testbench with PULSE inputs ***
* Input signals with PULSE
Vd d vss PULSE(0v 1.8v 49ns 1ns 1ns 49ns 100ns)
Vc c vss PULSE(0v 1.8v 99ns 1ns 1ns 99ns 200ns)
Vb b vss PULSE(0v 1.8v 199ns 1ns 1ns 199ns 400ns)
Va a vss PULSE(0v 1.8v 399ns 1ns 1ns 399ns 800ns)

XtestInv in1 inv_out vdd vss INV 
V1 in1 vss PULSE(0v 1.8v 49ns 1ns 1ns 49ns 100ns) 

XtestOr in4 in5 or_out vdd vss OR2
V4 in4 vss PULSE(0v 1.8v 99ns 1ns 1ns 99ns 200ns)
V5 in5 vss PULSE(0v 1.8v 49ns 1ns 1ns 49ns 100ns)

XtestAnd in2 in3 and_out vdd vss AND2
V2 in2 vss PULSE(0v 1.8v 99ns 1ns 1ns 99ns 200ns)
V3 in3 vss PULSE(0v 1.8v 49ns 1ns 1ns 49ns 100ns)
* Run the transient analysis
.tran 0.01n 1000n
.unprotect
.tem 30
.option post
.op
.end
