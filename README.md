# F1/10 Docking Container

## Setup

Clone the repository:
```
git clone --recursive git@github.com:PUT-F1TENTH/f1tenth_container.git
```

Build the container:
```
./build.sh
```

Run the container:
```
./run.sh
```

Build the workspace:
```
cd /root/ws
colcon build --symlink-install
```

Run:
```
ros2 launch launch/f1tenth_container.launch.py
```

## Useful commands

### VESC Driver

```
ros2 launch vesc_driver vesc_driver_node.launch.py
```

### VESC Tests

```
ros2 topic pub -r 1 /commands/ctrl control_interfaces/msg/Control '{steering_angle: 0.1}'
ros2 topic pub -r 1 /commands/ctrl control_interfaces/msg/Control '{set_speed: 1.0, control_mode: SPEED_MODE, set_current: 0.0}'
```

### OptiTrack

```
ros2 run optitrack publisher_main
```

### Docking

```
ros2 launch f1tenth_docking f1tenth_docking_launch.py
ros2 action send_goal docking_action_server f1tenth_docking_interfaces/action/Docking "{setpoint: {x_pos: 1.1, y_pos: 2.0, theta: 0.0, delta: 0.0}}"
```
