# F1/10 Docking Container

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

