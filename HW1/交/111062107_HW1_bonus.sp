** 111062107_HW1_bonus **
** Environment setting **
.protect
.lib "/usr/cad/cic018.l" tt
.unprotect

.global vdd vss 
Vdd vdd 0 DC=+1.8v 
Vgnd vss 0 DC=0v 
*************************
*      Your code        *
*************************
*** 2-to-1 Transmission Gate Multiplexer ***
.subckt MUX2 D0 D1 S0 Y vdd vss
* Transmission Gate 1: Pass D0 when S0 = 0 (S0_bar = 1)
mp1 D0 S0 Y vdd p_18 w=0.5u l=0.18u  
* PMOS controlled by S0_bar
mn1 D0 S0_bar Y vss n_18 w=0.25u l=0.18u    
* NMOS controlled by S0

* Transmission Gate 2: Pass D1 when S0 = 1 (S0_bar = 0)
mp2 Y S0_bar D1 vdd p_18 w=0.5u l=0.18u     
* PMOS controlled by S0
mn2 Y S0 D1 vss n_18 w=0.25u l=0.18u 
* NMOS controlled by S0_bar

* Inverter to generate S0_bar (complement of S0)
XINV S0 S0_bar vdd vss INV
.ends

*** 4-to-1 Multiplexer Using Three 2-to-1 MUXes ***
.subckt MUX4 D0 D1 D2 D3 S0 S1 Y vdd vss
* First stage: Select between D0, D1 and D2, D3 based on S0
XMUX2_1 D0 D1 S0 Y1 vdd vss MUX2 
XMUX2_2 D2 D3 S0 Y2 vdd vss MUX2 

* Second stage: Select between Y1 and Y2 based on S1
XMUX2_3 Y1 Y2 S1 Y vdd vss MUX2   
* Y = final output
.ends

*** Inverter Definition ***
.subckt INV in1 inv_out vdd vss
mp1    vdd    in1    inv_out    vdd    p_18    w=0.5u     l=0.18u     
mn1    inv_out    in1    vss    vss    n_18    w=0.25u    l=0.18u
.ends

XMUX4 D0 D1 D2 D3 S0 S1 Y vdd vss MUX4
XMUX2 D0 D1 S0 Y2 vdd vss MUX2
*** Testbench with PULSE inputs *** 
* Input signals with PULSE
V0 D0 vss PULSE(0v 1.8v 49ns 1ns 1ns 49ns 100ns)
V1 D1 vss PULSE(0v 1.8v 99ns 1ns 1ns 99ns 200ns)
V2 D2 vss PULSE(0v 1.8v 199ns 1ns 1ns 199ns 400ns)
V3 D3 vss PULSE(0v 1.8v 399ns 1ns 1ns 399ns 800ns)

* Vs0 S0 vss DC 0v 
* Vs1 S1 vss DC 0v 

* Vs0 S0 vss DC 1.8v 
* Vs1 S1 vss DC 0v 

* Vs0 S0 vss DC 0v 
* Vs1 S1 vss DC 1.8v 

* Vs0 S0 vss DC 1.8v 
* Vs1 S1 vss DC 1.8v

* Pulse for 'S0': V1=0V, V2=1.8V, period=200ns
Vs0 S0 vss PULSE(0v 1.8v 799ns 1ns 1ns 799ns 1600ns)

* Pulse for 'S1': delayed by 100ns, V1=0V, V2=1.8V, period=200ns
Vs1 S1 vss PULSE(0v 1.8v 1599ns 1ns 1ns 1599ns 3200ns)
* Run the transient analysis
.tran 0.01n 3200n
.unprotect
.tem 30
.option post
.op
.end