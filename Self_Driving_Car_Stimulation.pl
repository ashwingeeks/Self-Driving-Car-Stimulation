% ======================================================================
% SELF-DRIVING CAR DECISION SIMULATION (Strict ISO/GNU Prolog Safe)
% ======================================================================

% --- 1. SENSORS & STATE MANAGEMENT ---
:- dynamic(traffic_light/1).      
:- dynamic(obstacle_distance/1).  
:- dynamic(current_speed/1).      

% Initialize a default safe state
traffic_light(green).
obstacle_distance(100).
current_speed(0).


% --- 2. DECISION RULES (THE BRAIN) ---
decide_action(Action) :-
traffic_light(red),
Action = stop_for_red_light.

decide_action(Action) :-
obstacle_distance(Dist),
Dist < 20,
Action = emergency_brake.

decide_action(Action) :-
traffic_light(yellow),
Action = decelerate_for_yellow.

decide_action(Action) :-
obstacle_distance(Dist),
Dist >= 20,
Dist =< 50,
current_speed(Speed),
Speed > 30,
Action = decelerate_for_obstacle.

decide_action(Action) :-
traffic_light(green),
obstacle_distance(Dist),
Dist > 50,
Action = maintain_speed.


% --- 3. SIMULATION ENGINE ---
simulate_step(Light, Distance, Speed, Action) :-
% Clear old memory
retractall(traffic_light(_)),
retractall(obstacle_distance(_)),
retractall(current_speed(_)),
  
% Store new memory (Using assertz instead of assert)
assertz(traffic_light(Light)),
assertz(obstacle_distance(Distance)),
assertz(current_speed(Speed)),
  
% Decide what to do based on the new memory
decide_action(Action).


% --- 4. TEST SCENARIOS ---
run_scenario(Name, Light, Distance, Speed) :-
simulate_step(Light, Distance, Speed, Action),
format('--- Scenario: ~w ---~n', [Name]),
format('Sensors  -> Light: ~w | Distance: ~wm | Speed: ~w km/h~n', [Light, Distance, Speed]),
format('Decision -> ~w~n~n', [Action]).

run_all_tests :-
run_scenario('Clear Highway', green, 150, 80),
run_scenario('Approaching Traffic', green, 40, 60),
run_scenario('Pedestrian Step-out', green, 10, 40),
run_scenario('Yellow Light Ahead', yellow, 60, 50),
run_scenario('Red Light Stop', red, 15, 0).


% --- 5. EXECUTION ENTRY POINT ---
:- initialization(main).

main :- 
run_all_tests,
halt.
