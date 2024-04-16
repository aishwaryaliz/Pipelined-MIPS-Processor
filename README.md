# Pipelined-MIPS-Processor
A 5 staged pipelined MIPS Processor in Verilog with a forwarding unit that resolves data hazards

The processor has five pipelined stages - instruction fetch, instruction decode, execute, memory and writeback. It uses static branch prediction predicting branch not taken. 
It handles data hazards by forwarding from the execute memory stage or memory write back stage as required. In case of load word, it incorporates stalling to ensure correct transfer of data.
It handles control hazards by flushing the contents of the preceding pipelined registers in case branch is taken.

In the processor designed, the instruction memory has been initialised with the following instructions:
lw r1, 0(r0)
add r2, r1, r0
sub r2, r2, r1
jz r2 L
add r3, r2, r1
L: add r4, r2, r1
sw r1, 0(r5)
This processor can achieve a CPI of 2 for the above instruction set.

It is made using the Havard Architecture with seperate memory locations for data memory and instruction memory.

The code is synthesisable targetting an Artix-7 FPGA with 1% utilisation.
