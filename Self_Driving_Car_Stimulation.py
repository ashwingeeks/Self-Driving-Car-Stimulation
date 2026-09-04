traffic_light = "green"
obstacle_distance = 100
current_speed = 0

def decide_action(traffic_light, obstacle_distance, current_speed):

    if traffic_light == "red":
        return "stop_for_red_light"

    elif obstacle_distance < 20:
        return "emergency_brake"

    elif traffic_light == "yellow":
        return "decelerate_for_yellow"

    elif 20 <= obstacle_distance <= 50 and current_speed > 30:
        return "decelerate_for_obstacle"

    elif traffic_light == "green" and obstacle_distance > 50:
        return "maintain_speed"

    else:
        return "no_action"

def simulate_step(light, distance, speed):

    global traffic_light, obstacle_distance, current_speed

    traffic_light = light
    obstacle_distance = distance
    current_speed = speed

    action = decide_action(
        traffic_light,
        obstacle_distance,
        current_speed
    )

    return action

def run_scenario(name, light, distance, speed):

    action = simulate_step(light, distance, speed)

    print(f"--- Scenario: {name} ---")
    print(
        f"Sensors -> Light: {light} | "
        f"Distance: {distance}m | "
        f"Speed: {speed} km/h"
    )
    print(f"Decision -> {action}")
    print()

def run_all_tests():

    run_scenario(
        "Clear Highway",
        "green",
        150,
        80
    )

    run_scenario(
        "Approaching Traffic",
        "green",
        40,
        60
    )

    run_scenario(
        "Pedestrian Step-out",
        "green",
        10,
        40
    )

    run_scenario(
        "Yellow Light Ahead",
        "yellow",
        60,
        50
    )

    run_scenario(
        "Red Light Stop",
        "red",
        15,
        0
    )

if __name__ == "__main__":
    run_all_tests()
