from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch.substitutions import PathJoinSubstitution
from launch_ros.actions import Node
from launch_ros.substitutions import FindPackageShare


def generate_launch_description():

    return LaunchDescription(
        [
            Node(
                package="tf2_ros",
                namespace="predicted_states_to_map",
                executable="static_transform_publisher",
                arguments=["0", "0", "0", "0", "0", "0", "map", "predicted_states"],
            ),
            Node(
                package="tf2_ros",
                namespace="predicted_states_to_map",
                executable="static_transform_publisher",
                arguments=["0", "0", "0", "0", "0", "0", "map", "odom"],
            ),
            IncludeLaunchDescription(
                PythonLaunchDescriptionSource(
                    PathJoinSubstitution(
                        [
                            FindPackageShare("vesc_driver"),
                            "launch",
                            "vesc_driver_node.launch.py",
                        ]
                    )
                )
            ),
            IncludeLaunchDescription(
                PythonLaunchDescriptionSource(
                    PathJoinSubstitution(
                        [
                            FindPackageShare("optitrack"),
                            "launch",
                            "optitrack.launch.py",
                        ]
                    )
                )
            ),
            IncludeLaunchDescription(
                PythonLaunchDescriptionSource(
                    PathJoinSubstitution(
                        [
                            FindPackageShare("f1tenth_docking"),
                            "launch",
                            "f1tenth_docking.launch.py",
                        ]
                    )
                )
            ),
        ]
    )
