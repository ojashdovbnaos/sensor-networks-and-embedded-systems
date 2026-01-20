# sensor-networks-and-embedded-systems

This repository contains four academic projects covering **embedded systems programming** and **wireless sensor network (WSN) analysis and design**. The projects focus on low-level ARM assembly programming, real-time embedded systems, and network modeling and analysis.

---

## Project 1: Fibonacci Sequence Display on ARM Cortex-A9

### Overview
This project involves programming an **ARM® Cortex-A9 processor** on a **DE1-SoC board** using **ARMv7 assembly language**.

### Objective
- Compute the **first 10 Fibonacci numbers**
- Display each number on a **seven-segment display**
- Show each number for **1 second**
- Continuously loop through the sequence

### Key Concepts
- ARMv7 assembly programming  
- Hardware timer usage  
- Seven-segment display control  
- Infinite loop implementation  

---

## Project 2: Interrupt-Driven Decimal Counter

### Overview
This project implements a **three-digit decimal counter** on the DE1-SoC board using **ARM Cortex-A9 assembly language** with **interrupt handling**.

### Objective
- Count accurately in **1-second intervals**
- Display the count on a **seven-segment display**
- Use an **interrupt-enabled push button** to reverse the counting direction
- Support rollover:
  - 999 → 000 when counting up
  - 000 → 999 when counting down
- Run continuously

### Key Concepts
- Interrupt-driven programming  
- Timer-based time measurement  
- Push-button interrupt handling  
- Real-time embedded system design  

---

## Project 3: Wireless Sensor Network Connectivity Analysis

### Overview
This project analyzes a **pseudo-random wireless sensor network (WSN)** consisting of **25 nodes** distributed in a unit square environment.

### Objective
- Ensure **full network connectivity**
- Evaluate network performance and robustness
- Add nodes if necessary to achieve full connectivity

### Analysis Performed
- **Voronoi tessellation** (maximal breach distance)
- **Delaunay triangulation** (maximal support distance)
- Node connectivity and communication coverage analysis

### Key Concepts
- Computational geometry  
- Network connectivity analysis  
- WSN robustness evaluation  

---

## Project 4: Wireless Sensor Network Design for Environmental Monitoring

### Overview
This project focuses on designing a **wireless sensor network** under specific constraints to support **animal population tracking** and **environmental monitoring** in a given habitat.

### Objective
- Design a WSN that satisfies task-specific and environmental constraints
- Support data collection for:
  - Animal movement tracking
  - Environmental condition monitoring

### Key Concepts
- WSN system-level design  
- Sensor placement strategies  
- Trade-offs between coverage, connectivity, and resource constraints  

---

## Technologies & Tools
- ARMv7 Assembly  
- DE1-SoC (ARM Cortex-A9)  
- Hardware timers and interrupts  
- MATLAB / Computational geometry tools (WSN analysis)

---
