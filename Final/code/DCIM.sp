** DCIM **
** Environment setting **
.tran 0.01n 26n
.option POST
.protect
.lib "/usr/cad/cic018.l" tt
.temp 30
.unprotect

.global vdd gnd 
Vdd vdd 0 DC=+1.8v 
Vgnd gnd 0 DC=0v 

.param    CLK_Period = 2n
.param    CLK_Period_2 = 'CLK_Period/2'
.param    r_time = 1p
.param    f_time = 1p
.param    SupplyV = 1.8v
**********************************************
*** Don't modify the pin name in this file ***
**********************************************

*****************
*** call cell ***
*****************
Xdcim I1 I2 I3 I4 IN_VAL CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 OUT_VAL DCIM
Xlatch1 gnd vdd lat_w13 n1 vdd gnd LATCH
Xlatch2 gnd vdd lat_w12 n2 vdd gnd LATCH
Xlatch3 gnd vdd lat_w11 n3 vdd gnd LATCH
Xlatch4 vdd gnd lat_w10 n4 vdd gnd LATCH
******************
*** DCIM block ***
******************
.subckt DCIM I1 I2 I3 I4 IN_VAL CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 OUT_VAL
** Your code **
XINV1 IN_VAL in_val_inv vdd gnd INV        * Invert IN_VAL
XDFF1 in_val_inv CLK OUT_VAL vdd gnd DFF  * Delay the inverted signal by 1 cycle

Xcontrol_in I1 I2 I3 I4 CLK IN_VAL ii1 ii2 ii3 ii4 vdd gnd CON_IN

Xmul1 ii1 gnd gnd gnd vdd out13 out12 out11 out10 vdd gnd mul4
*0 0 0 1
Xmul2 ii2 gnd gnd vdd vdd out23 out22 out21 out20 vdd gnd mul4
*0 0 1 1
Xmul3 ii3 gnd vdd vdd vdd out33 out32 out31 out30 vdd gnd mul4
*0 1 1 1
Xmul4 ii4 vdd vdd vdd vdd out43 out42 out41 out40 vdd gnd mul4
*1 1 1 1

* Xlatch1 gnd vdd lat_w13 n1 vdd gnd LATCH
* Xlatch2 gnd vdd lat_w12 n2 vdd gnd LATCH
* Xlatch3 gnd vdd lat_w11 n3 vdd gnd LATCH
* Xlatch4 vdd gnd lat_w10 n4 vdd gnd LATCH

* Xlatch5 gnd vdd lat_w23 n5 vdd gnd LATCH
* Xlatch6 gnd vdd lat_w22 n6 vdd gnd LATCH
* Xlatch7 vdd gnd lat_w21 n7 vdd gnd LATCH
* Xlatch8 vdd gnd lat_w20 n8 vdd gnd LATCH

* Xlatch9 gnd vdd lat_w33 n9 vdd gnd LATCH
* Xlatch10 vdd gnd lat_w32 n10 vdd gnd LATCH
* Xlatch11 vdd gnd lat_w31 n11 vdd gnd LATCH
* Xlatch12 vdd gnd lat_w30 n12 vdd gnd LATCH

* Xlatch13 vdd gnd lat_w43 n13 vdd gnd LATCH
* Xlatch14 vdd gnd lat_w42 n14 vdd gnd LATCH
* Xlatch15 vdd gnd lat_w41 n15 vdd gnd LATCH
* Xlatch16 vdd gnd lat_w40 n16 vdd gnd LATCH

* * Multipliers using latched weights
* Xmul1 ii1 lat_w13 lat_w12 lat_w11 lat_w10 out13 out12 out11 out10 vdd gnd mul4
* Xmul2 ii2 lat_w23 lat_w22 lat_w21 lat_w20 out23 out22 out21 out20 vdd gnd mul4
* Xmul3 ii3 lat_w33 lat_w32 lat_w31 lat_w30 out33 out32 out31 out30 vdd gnd mul4
* Xmul4 ii4 lat_w43 lat_w42 lat_w41 lat_w40 out43 out42 out41 out40 vdd gnd mul4

Xaddertree0 out13 out12 out11 out10 out23 out22 out21 out20 out33 out32 out31 out30 out43 out42 out41 out40 s5 s4 s3 s2 s1 s0 addertree

* 2
Xmul5 ii1 gnd gnd vdd gnd out13n out12n out11n out10n vdd gnd mul4 
* 6
Xmul6 ii2 gnd vdd vdd gnd  out23n out22n out21n out20n vdd gnd mul4
* 8
Xmul7 ii3 vdd gnd gnd gnd out33n out32n out31n out30n vdd gnd mul4
* 12
Xmul8 ii4 vdd vdd gnd gnd out43n out42n out41n out40n vdd gnd mul4

* Xlatch17 gnd vdd lat_w13n n17 vdd gnd LATCH
* Xlatch18 gnd vdd lat_w12n n18 vdd gnd LATCH
* Xlatch19 vdd gnd lat_w11n n19 vdd gnd LATCH
* Xlatch20 gnd vdd lat_w10n n20 vdd gnd LATCH

* Xlatch21 gnd vdd lat_w23n n21 vdd gnd LATCH
* Xlatch22 vdd gnd lat_w22n n22 vdd gnd LATCH
* Xlatch23 vdd gnd lat_w21n n23 vdd gnd LATCH
* Xlatch24 gnd vdd lat_w20n n24 vdd gnd LATCH

* Xlatch25 vdd gnd lat_w33n n25 vdd gnd LATCH
* Xlatch26 gnd vdd lat_w32n n26 vdd gnd LATCH
* Xlatch27 gnd vdd lat_w31n n27 vdd gnd LATCH
* Xlatch28 gnd vdd lat_w30n n28 vdd gnd LATCH

* Xlatch29 vdd gnd lat_w43n n29 vdd gnd LATCH
* Xlatch30 vdd gnd lat_w42n n30 vdd gnd LATCH
* Xlatch31 gnd vdd lat_w41n n31 vdd gnd LATCH
* Xlatch32 gnd vdd lat_w40n n32 vdd gnd LATCH

* Xmul5 ii1 lat_w13n lat_w12n lat_w11n lat_w10n out13 out12 out11 out10 vdd gnd mul4
* Xmul6 ii2 lat_w23n lat_w22n lat_w21n lat_w20n out23 out22 out21 out20 vdd gnd mul4
* Xmul7 ii3 lat_w33n lat_w32n lat_w31n lat_w30n out33 out32 out31 out30 vdd gnd mul4
* Xmul8 ii4 lat_w43n lat_w42n lat_w41n lat_w40n out43 out42 out41 out40 vdd gnd mul4

Xaddertree1 out13n out12n out11n out10n out23n out22n out21n out20n out33n out32n out31n out30n out43n out42n out41n out40n s11 s10 s9 s8 s7 s6 addertree

Xadd1 s5 s4 s3 s2 s1 s0     O18 O17 O16 O15 O14 O13 O12 O11 O10 gnd     P19 P18 P17 P16 P15 P14 P13 P12 P11 P10     vdd gnd adder10

Xadd2 s11 s10 s9 s8 s7 s6 O28 O27 O26 O25 O24 O23 O22 O21 O20 gnd P29 P28 P27 P26 P25 P24 P23 P22 P21 P20 vdd gnd adder10

Xcontrol_out1 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 CON_OUT
Xcontrol_out2 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 CLK RST O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 CON_OUT
.ends

.subckt LATCH S R Q Q_bar vdd gnd
* NOR Gate for Reset
XNOR1 R Q_bar Q vdd gnd NOR2

* NOR Gate for Set
XNOR2 S Q Q_bar vdd gnd NOR2
.ends

* 10-bit
.subckt adder10 a5 a4 a3 a2 a1 a0   b9 b8 b7 b6 b5 b4 b3 b2 b1 b0   s9 s8 s7 s6 s5 s4 s3 s2 s1 s0   vdd gnd
Xand1 a0 b0 carry0 vdd gnd AND2
Xxor a0 b0 s0 vdd gnd XOR
Xadder1 a1 b1 gnd carry1 s1 vdd gnd mirroradder
Xadder2 a2 b2 carry1 carry2 s2 vdd gnd mirroradder
Xadder3 a3 b3 carry2 carry3 s3 vdd gnd mirroradder
Xadder4 a4 b4 carry3 carry4 s4 vdd gnd mirroradder
Xadder5 a5 b5 carry4 carry5 s5 vdd gnd mirroradder
Xadder6 gnd b6 carry5 carry6 s6 vdd gnd mirroradder
Xadder7 gnd b7 carry6 carry7 s7 vdd gnd mirroradder
Xadder8 gnd b8 carry7 carry8 s8 vdd gnd mirroradder
Xadder9 gnd b9 carry8 carry9 s9 vdd gnd mirroradder
.ends

.subckt addertree a3 a2 a1 a0 b3 b2 b1 b0 c3 c2 c1 c0 d3 d2 d1 d0 s5 s4 s3 s2 s1 s0
Xmirroradder1 a0 b0 gnd net1 sum0 vdd gnd mirroradder
Xmirroradder2 a1 b1 net1 net2 sum1 vdd gnd mirroradder
Xmirroradder3 a2 b2 net2 net3 sum2 vdd gnd mirroradder
Xmirroradder4 a3 b3 net3 net4 sum3 vdd gnd mirroradder

Xmirroradder5 c0 d0 gnd net5 sum4 vdd gnd mirroradder
Xmirroradder6 c1 d1 net5 net6 sum5 vdd gnd mirroradder
Xmirroradder7 c2 d2 net6 net7 sum6 vdd gnd mirroradder
Xmirroradder8 c3 d3 net7 net8 sum7 vdd gnd mirroradder

Xmirroradder9 sum0 sum4 gnd net9 s0 vdd gnd mirroradder
Xmirroradder10 sum1 sum5 net9 net10 s1 vdd gnd mirroradder
Xmirroradder11 sum2 sum6 net10 net11 s2 vdd gnd mirroradder
Xmirroradder12 sum3 sum7 net11 net12 s3 vdd gnd mirroradder
Xmirroradder13 net4 net8 net12 s5 s4 vdd gnd mirroradder
.ends
************************
*** input controller ***
************************
.subckt CON_IN I1 I2 I3 I4 CLK IN_VAL ii1 ii2 ii3 ii4 vdd gnd
* Logic: Only pass inputs when IN_VAL is high
XAND1 I1 IN_VAL net1 vdd gnd AND2
XAND2 I2 IN_VAL net2 vdd gnd AND2
XAND3 I3 IN_VAL net3 vdd gnd AND2
XAND4 I4 IN_VAL net4 vdd gnd AND2
* D Flip-Flops to synchronize inputs to CLK
XDFF1 net1 CLK ii1 vdd gnd DFF
XDFF2 net2 CLK ii2 vdd gnd DFF
XDFF3 net3 CLK ii3 vdd gnd DFF
XDFF4 net4 CLK ii4 vdd gnd DFF
.ends

.subckt DFF D CLK Q vdd gnd
XINV_clk CLK clk_inv vdd gnd INV
XINV_D D D_inv vdd gnd INV
Xa1 D clk_inv net1 vdd gnd NAND2
Xa2 D_inv clk_inv net2 vdd gnd NAND2
Xa3 net1 net4 net3 vdd gnd NAND2
Xa4 net2 net3 net4 vdd gnd NAND2

XINV_net3 net3 net3_inv vdd gnd INV

Xa5 net3 clk net5 vdd gnd NAND2
Xa7 net3_inv clk net6 vdd gnd NAND2
Xa8 net5 net8 Q vdd gnd NAND2
Xa9 net6 Q net8 vdd gnd NAND2
.ends

*************************
*** output controller ***
*************************
.subckt CON_OUT P0 P1 P2 P3 P4 P5 P6 P7 P8 P9 CLK RST O0 O1 O2 O3 O4 O5 O6 O7 O8 O9
*** Your code ***
*** Logic to handle reset functionality ***
XAND0 P0 RST reset0 vdd gnd AND2
XAND1 P1 RST reset1 vdd gnd AND2
XAND2 P2 RST reset2 vdd gnd AND2
XAND3 P3 RST reset3 vdd gnd AND2
XAND4 P4 RST reset4 vdd gnd AND2
XAND5 P5 RST reset5 vdd gnd AND2
XAND6 P6 RST reset6 vdd gnd AND2
XAND7 P7 RST reset7 vdd gnd AND2
XAND8 P8 RST reset8 vdd gnd AND2
XAND9 P9 RST reset9 vdd gnd AND2

*** Flip-flops with reset-aware inputs ***
XFF0 reset0 CLK O0 vdd gnd DFF
XFF1 reset1 CLK O1 vdd gnd DFF
XFF2 reset2 CLK O2 vdd gnd DFF
XFF3 reset3 CLK O3 vdd gnd DFF
XFF4 reset4 CLK O4 vdd gnd DFF
XFF5 reset5 CLK O5 vdd gnd DFF
XFF6 reset6 CLK O6 vdd gnd DFF
XFF7 reset7 CLK O7 vdd gnd DFF
XFF8 reset8 CLK O8 vdd gnd DFF
XFF9 reset9 CLK O9 vdd gnd DFF
.ends

*******************
*** Your subckt ***
*******************
.subckt INV in1 inv_out vdd gnd
mp1    vdd    in1    inv_out    vdd    p_18    w=0.72u     l=0.18u     
mn1    inv_out    in1    gnd    gnd    n_18    w=0.36u    l=0.18u
.ends
*** NAND Gate ***
.subckt NAND2 in1 in2 NNAD_out vdd gnd
mp1    vdd    in1    NNAD_out    vdd    p_18    w=0.72u     l=0.18u
mp2    vdd    in2    NNAD_out    vdd    p_18    w=0.72u     l=0.18u
mn1    NNAD_out    in1    net1    gnd    n_18    w=0.36u    l=0.18u
mn2    net1    in2    gnd      gnd    n_18    w=0.36u    l=0.18u
.ends
*** AND Gate ***
.subckt AND2 in2 in3 and_out vdd gnd
XNAND in2 in3 net_nand vdd gnd NAND2
XINV net_nand AND_out vdd gnd INV
.ends
.subckt AND3 in1 in2 in3 and_out vdd gnd
XAND1 in1 in2 net1 vdd gnd AND2
XAND2 net1 in3 and_out vdd gnd AND2
.ends
*** NOR Gate ***
.subckt NOR2 in1 in2 NOR_out vdd gnd
mp1    vdd    in1    net2    vdd    p_18    w=0.72u     l=0.18u
mp2    net2   in2    NOR_out vdd    p_18    w=0.72u     l=0.18u
mn1    NOR_out  in1    gnd    gnd    n_18    w=0.36u    l=0.18u
mn2    NOR_out  in2    gnd    gnd    n_18    w=0.36u    l=0.18u
.ends
*** OR Gate ***
.subckt OR2 in4 in5 or_out vdd gnd
XNOR in4 in5 net_nor vdd gnd NOR2
XINV net_nor OR_out vdd gnd INV
.ends
*** adder ***
.subckt mirroradder a b cin cout sum vdd gnd
mp1    vdd   a   net1   vdd   p_18   w=0.72u   l=0.18u
mp2    vdd   b   net1   vdd   p_18   w=0.72u   l=0.18u
mp3    net1  cin  n_cout   vdd   p_18   w=0.72u   l=0.18u
mn1    n_cout   cin   net2   gnd   n_18   w=0.36u   l=0.18u
mn2    net2   b   gnd   gnd   n_18   w=0.36u   l=0.18u
mn3    net2   a   gnd   gnd   n_18   w=0.36u   l=0.18u
mp4    vdd    b   net3  vdd   p_18   w=0.72u   l=0.18u
mp5    net3    a   n_cout  vdd   p_18   w=0.72u   l=0.18u
mn4    n_cout    a   net4  gnd   n_18   w=0.36u   l=0.18u
mn5    net4    b   gnd  gnd   n_18   w=0.36u   l=0.18u
XINV1 n_cout cout vdd gnd INV
mp6    vdd    a    net5    vdd    p_18    w=0.72u   l=0.18u  
mp7    vdd    b    net5    vdd    p_18    w=0.72u   l=0.18u  
mp8    vdd    cin    net5    vdd    p_18    w=0.72u   l=0.18u  
mp9    net5    n_cout    n_sum    vdd    p_18    w=0.72u   l=0.18u  
mn6    n_sum    n_cout    net6    gnd    n_18    w=0.36u   l=0.18u  
mn7    net6    a    gnd    gnd    n_18    w=0.36u   l=0.18u  
mn8    net6    b    gnd    gnd    n_18    w=0.36u   l=0.18u  
mn9    net6    cin    gnd    gnd    n_18    w=0.36u   l=0.18u 
mp10    vdd    b    net7    vdd    p_18    w=0.72u   l=0.18u  
mp11    net7    a    net8    vdd    p_18    w=0.72u   l=0.18u  
mp12    net8    cin    n_sum    vdd    p_18    w=0.72u   l=0.18u 
mn10    n_sum    cin    net9    gnd    n_18    w=0.36u   l=0.18u  
mn11    net9    a    net10    gnd    n_18    w=0.36u   l=0.18u  
mn12    net10    b    gnd    gnd    n_18    w=0.36u   l=0.18u
XINV2 n_sum sum vdd gnd INV 
* mpX    source    gate    drain    vdd    p_18    w=0.72u   l=0.18u  
* mnX    drain    gate    source    gnd    n_18    w=0.36u   l=0.18u  
.ends

.subckt mul4 in w3 w2 w1 w0 out3 out2 out1 out0 vdd gnd
XAND0 in w0 out0 vdd gnd AND2
XAND1 in w1 out1 vdd gnd AND2
XAND2 in w2 out2 vdd gnd AND2
XAND3 in w3 out3 vdd gnd AND2
.ends

.subckt XOR A B Y vdd gnd
* NAND gates for XOR logic
XNAND1 A B nand1_out vdd gnd NAND2
XNAND2 A nand1_out nand2_out vdd gnd NAND2
XNAND3 B nand1_out nand3_out vdd gnd NAND2
* Final NAND gate to produce XOR output
XNAND4 nand2_out nand3_out Y vdd gnd NAND2
.ends
* testadder
* Xadder a b cin cout sum vdd gnd mirroradder
* Vc a gnd PULSE(0v 1.8v 99ns 1ns 1ns 99ns 200ns)
* Vb b gnd PULSE(0v 1.8v 199ns 1ns 1ns 199ns 400ns)
* Va cin gnd PULSE(0v 1.8v 399ns 1ns 1ns 399ns 800ns)

* testmul
* Xmul in w3 w2 w1 w0 out3 out2 out1 out0 vdd gnd mul4
* Vd w0 gnd PULSE(0v 1.8v 49ns 1ns 1ns 49ns 100ns)
* Vc w1 gnd PULSE(0v 1.8v 99ns 1ns 1ns 99ns 200ns)
* Vb w2 gnd PULSE(0v 1.8v 199ns 1ns 1ns 199ns 400ns)
* Va w3 gnd PULSE(0v 1.8v 399ns 1ns 1ns 399ns 800ns)
* Ve in gnd PULSE(0v 1.8v 799ns 1ns 1ns 799ns 1600ns)

* .ic V(w11)=voltage
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