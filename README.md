# RISC-V_CPU
A RISC-V Based CPU. Includes support for I, S, B, R type instructions. This includes a Datapath module and a Control Unit Module. Each of which are relatively complex.

## Details
### The Top Level 0 Diagram
A overview diagram of the CPU Module and its inputs and outputs.

![alt text](https://github.com/baxtrax/RISC-V_CPU/blob/main/Images/schemeit-project%20(5).png?raw=true)

### The Top Level 1 Diagram (Inside CPU)

![alt text](https://github.com/baxtrax/RISC-V_CPU/blob/main/Images/schemeit-project%20(4).png?raw=true)

### Inside Datapath

![alt text](https://github.com/baxtrax/RISC-V_CPU/blob/main/Images/Datapath-Level1.png)

### Testbench and verification
The CPU Module is composed of one main file, cpu.v. This module has its own respective testbench to verify the code. Every other component used has its own testbench to test for validity. If simulations are run, pay attention to the outputs of the simulation console, as the wires are not shown in a wave diagram.

#### Testing and Verification
##### Testing CPU Module (The expected result)

![alt text](https://github.com/baxtrax/RISC-V_CPU/blob/main/Images/FINALEXPECTED.png?raw=true)

##### Testing CPU Module (Results)

Loop 1 (addi x3,x0,6)

![alt text](https://github.com/baxtrax/RISC-V_CPU/blob/main/Images/FINALLoop1.png?raw=true)

Loop 2 (addi x4,x0,4)

![alt text](https://github.com/baxtrax/RISC-V_CPU/blob/main/Images/FINALLoop2.png?raw=true)

Loop 3 (add x4, x4, x3)

![alt text](https://github.com/baxtrax/RISC-V_CPU/blob/main/Images/FINALLoop3.png?raw=true)

Loop 4 (sw x4, 0(x0))

![alt text](https://github.com/baxtrax/RISC-V_CPU/blob/main/Images/FINALLoop4.png?raw=true)

Loop 5 (lw x5, 0(x0))

![alt text](https://github.com/baxtrax/RISC-V_CPU/blob/main/Images/FINALLoop5.png?raw=true)

beq x4, x5, 8

![alt text](https://github.com/baxtrax/RISC-V_CPU/blob/main/Images/FINALLoop6.png?raw=true)

The CPU Module has a testbench included if you would want to verify these results.

## Running it
You can use these files with any type of simulation software. This project I personally used Quartus Prime and its simulation package that comes with named ModelSim(Now updated to QuestaSim) but any software that can run and simulate verilog code should do just fine as well.
