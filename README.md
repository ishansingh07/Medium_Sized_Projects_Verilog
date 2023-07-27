# Medium-Sized Verilog Projects

![Verilog Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Verilog_Logo.svg/250px-Verilog_Logo.svg.png)

Welcome to the world of medium-sized Verilog projects! In this repository, you'll find a collection of Verilog projects that strike the right balance between complexity and manageability, providing an excellent opportunity to enhance your skills and explore the fascinating realm of digital circuit design.

## About Verilog

[Verilog](https://en.wikipedia.org/wiki/Verilog) is a hardware description language (HDL) used to model and design digital circuits and systems. It is widely used in the electronics industry for creating hardware components, ranging from small integrated circuits to complex systems like microprocessors and application-specific integrated circuits (ASICs).

## Getting Started

To get started with these medium-sized Verilog projects, you'll need the following:

- A Verilog compiler or simulator (e.g., [Icarus Verilog](http://iverilog.icarus.com/))
- A text editor or an Integrated Development Environment (IDE) for coding (e.g., [Visual Studio Code](https://code.visualstudio.com/) with Verilog plugins)
- An FPGA development board (optional) for hardware testing

## Project List

1. [UART Communication Module](./UART_Communication_Module) - A Universal Asynchronous Receiver-Transmitter (UART) module for serial communication.
2. [Finite State Machine (FSM)](./Finite_State_Machine) - A versatile FSM capable of handling various sequences and operations.
3. [Digital Clock](./Digital_Clock) - A digital clock that displays hours, minutes, and seconds on a seven-segment display.
4. [I2C Controller](./I2C_Controller) - An I2C controller for interfacing with I2C devices like sensors and memory chips.
5. [SPI Master](./SPI_Master) - An SPI master module to communicate with SPI-compatible peripherals.
6. [PWM Generator](./PWM_Generator) - A Pulse Width Modulation (PWM) generator for controlling LED brightness or motor speed.
7. [Traffic Light Controller](./Traffic_Light_Controller) - An intelligent traffic light controller capable of handling traffic flow efficiently.

## How to Use

Each project folder contains the Verilog source files and a testbench to simulate the design. To run the simulations:

1. Navigate to the project folder of interest.
2. Compile the Verilog files using your Verilog compiler. For example, with Icarus Verilog, use the following command: `iverilog -o testbench.out *.v`
3. Execute the simulation: `vvp testbench.out`
