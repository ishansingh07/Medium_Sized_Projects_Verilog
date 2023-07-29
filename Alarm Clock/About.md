# 12-Hour Alarm Clock in Verilog

## Description

The 12-hour alarm clock in Verilog is a digital clock with alarm functionality designed to operate in a 12-hour time format (AM/PM) using Binary-Coded Decimal (BCD) representation for hours, minutes, and seconds. The clock displays the current time and allows the user to set an alarm time in BCD format. When the alarm time matches the current time, the alarm is triggered, indicating that the set time has been reached. The alarm can be toggled on/off, and there is a provision to stop the alarm once it is triggered.

This project is implemented using Verilog hardware description language (HDL) and can be simulated using a Verilog simulator to verify its functionality.

## Modules

The design of the 12-hour alarm clock is divided into several modules, each responsible for specific functionalities. The main modules of the design are as follows:

1. `Alarm_clock`: This is the top-level module that integrates all other modules and implements the complete alarm clock functionality. It consists of sub-modules for timekeeping, alarm control, and clock division.

2. `count_60`: This module is responsible for counting the seconds in the clock, with provisions for minutes and hours incrementing when necessary.

3. `count_12`: This module takes care of incrementing the hours in the 12-hour format, ensuring it cycles back to 1 after reaching 12.

4. `Alarm_clock_tb`: This is the testbench module used to verify the functionality of the 12-hour alarm clock design.

## Testbench

The `Alarm_clock_tb` module instantiates the `Alarm_clock` module and provides stimulus to simulate the operation of the 12-hour alarm clock. The testbench initializes the clock, sets the current time, sets the alarm time, enables the alarm, and simulates the passage of time. Once the alarm is triggered, the testbench stops the alarm, and the simulation is concluded.

## Simulation

To verify the proper functionality of the 12-hour alarm clock design, the `Alarm_clock_tb` testbench is executed in a Verilog simulator. The simulation output provides insights into the clock's behavior, including timekeeping, alarm triggering, and alarm stoppage.

## Usage

To use the 12-hour alarm clock in a real hardware application, the Verilog design needs to be synthesized and implemented on a suitable FPGA or ASIC device. Additionally, appropriate hardware interfaces, such as displays and buttons, need to be connected to interact with the alarm clock.

