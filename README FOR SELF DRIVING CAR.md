# Self-Driving-Car-Stimulation
A simple Prolog-based project that simulates a self-driving car using rule-based decision making for traffic lights, obstacles, and speed control.


HUMAN LIKE SELF DRIVING CAR AL (PROLOG)
    A smart self driving simulation built in Prolog that mimics human-like reasoning, decision-making, and learning behavior.

## Overview

   This repository contains a logic-based simulation environment for autonomous vehicles (AVs) built entirely in Prolog.
   
   
   ## Key Features
   
* **Rule-Based Decision Making:** Encodes real-world traffic laws and safety constraints into a logical expert system.
* **Symbolic Environmental Processing:** Represents the road, intersections, and hazards as discrete facts for the AI to process.
* **Deterministic Hazard Avoidance:** Uses logical deductions to guarantee safe braking and maneuvering when obstacles are detected.
* **State-Space Pathfinding:** Leverages Prolog's native backtracking to calculate optimal routes through a simulated grid or road network.

## How It Works

The environment is defined by a set of dynamic facts, while the car's behavior is governed by Prolog rules. The core engine continuously queries the best `action/1` based on the current state of the road. 


## 🛠️ Technologies

- **Language**: Prolog (SWI-Prolog recommended)
- **Simulation Style**: Text-based / Console visualization
- **Paradigm**: Declarative Logic Programming

## 🚀 How to Run

### 1. Install SWI-Prolog
- **Windows**: Download from [SWI-Prolog website](https://www.swi-prolog.org/download.html)
- **Mac**: `brew install swi-prolog`
- **Linux**: `sudo apt install swi-prolog`

### 2. Clone the Repository
```bash
git clone https://github.com/yourusername/self-driving-car-prolog.git
cd self-driving-car-prolog

##Simulation Controls (in Console)

next     → Advance one simulation step
run(N)   → Run N simulation steps automatically
status   → Show current car and environment state
rules    → Display active decision rules
quit     → Exit simulation

**Example Logic:**
```prolog
% The car must stop if the light is red and the intersection is near.
action(stop) :- 
    sensor(traffic_light, red), 
    distance(intersection, D), D < 10.

% The car may proceed if the path is clear.
action(drive_forward) :- 
    sensor(path_ahead, clear), 
    sensor(traffic_light, green).

Example Output
text=== Self-Driving Car Simulation Step 12 ===
Position: Lane 2, Distance: 245m
Speed: 65 km/h
Traffic Light: GREEN
Obstacle: Car ahead at 28m
Action Taken: Maintain speed
Reason: Safe following distance maintained
