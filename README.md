# Medium-Sized Verilog Projects

Welcome to the world of medium-sized Verilog projects! In this repository, you'll find a collection of Verilog projects that strike the right balance between complexity and manageability, providing an excellent opportunity to enhance your skills and explore the fascinating realm of digital circuit design.

## About Verilog

[Verilog](https://en.wikipedia.org/wiki/Verilog) is a hardware description language (HDL) used to model and design digital circuits and systems. It is widely used in the electronics industry for creating hardware components, ranging from small integrated circuits to complex systems like microprocessors and application-specific integrated circuits (ASICs).

## Getting Started

To get started with these medium-sized Verilog projects, you'll need the following:

- A Verilog compiler or simulator (e.g., [Icarus Verilog](http://iverilog.icarus.com/))
- A text editor or an Integrated Development Environment (IDE) for coding (e.g., [Visual Studio Code](https://code.visualstudio.com/) with Verilog plugins)
- An FPGA development board (optional) for hardware testing

## Project List

1. [Conway's Game of Life](https://github.com/ishansingh07/Medium_Sized_Projects_Verilog/tree/main/Conway's%20Game%20of%20Life)  - Conway's Game of Life is a fascinating and iconic example of a cellular automaton, a mathematical model of a self-replicating system with simple rules.
2. [12-hour alarm clock](https://github.com/ishansingh07/Medium_Sized_Projects_Verilog/tree/main/Alarm%20Clock) - The 12-hour alarm clock in Verilog is a digital clock with alarm functionality designed to operate in a 12-hour time format (AM/PM) using Binary-Coded Decimal (BCD) representation for hours, minutes, and seconds. 
## How to Use

Each project folder contains the Verilog source files and a testbench to simulate the design. To run the simulations:

1. Navigate to the project folder of interest.
2. Compile the Verilog files using your Verilog compiler. For example, with Icarus Verilog, use the following command: `iverilog -o testbench.out *.v`
3. Execute the simulation: `vvp testbench.out`
