
# UART communication protocol

###  Overview

This project implements a UART Transmitter in Verilog, supporting configurable data length, stop bits, parity type, and baud rate.
The design is modular and divided into parity generation, frame generation, PISO shift register, and baud rate generator.

### ⚡ Features

 - UART frame generation (start bit, data bits, optional parity, stop bits)
 - Parity support (odd/even)
 - Baud rate generation for flexible communication speeds
 - Parallel-in serial-out (PISO) transmission logic449-how-to-write-a-good-readme-for-your-github-project)
  - Fully verified using simulation testbenches

