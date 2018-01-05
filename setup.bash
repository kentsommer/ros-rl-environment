SCRIPT_PATH="$(dirname "$(readlink -f "$0")")"

export PYTHONPATH=~/Software/ROS/ros_catkin_ws/build_isolated/opencv3/devel/lib:$PYTHONPATH

source ~/Software/ROS/ros_catkin_ws/devel_isolated/setup.bash
source ~/Software/ROS/misc_catkin_ws/devel_isolated/setup.bash
source ~/Software/ROS/turtlebot_catkin_ws/devel_isolated/setup.bash