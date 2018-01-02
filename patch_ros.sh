sudo echo
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


##########################################
## Pull in patched ROS src for Python 3 ##
##########################################

############
## Catkin ##
############
cd ~/Software/ROS/ros_catkin_ws/src
rm -rf catkin
git clone https://github.com/ros/catkin.git -b kinetic-devel


##############
## Geometry ##
##############
cd ~/Software/ROS/ros_catkin_ws/src
rm -rf geometry
git clone https://github.com/ros/geometry.git -b indigo-devel


################
## Geometry 2 ##
################
cd ~/Software/ROS/ros_catkin_ws/src
rm -rf geometry2
## This should be replaced with ROS repo after PR is merged
git clone https://github.com/kentsommer/geometry2.git -b patch-1
cd geometry2
rm -rf test_tf2
rm -rf geometry_experimental


##############
## ROS COMM ##
##############
cd ~/Software/ROS/ros_catkin_ws/src
rm -rf ros_comm
## This should be replaced with ROS repo after PR is merged
git clone https://github.com/kentsommer/ros_comm.git -b kinetic-devel


###########################
## Robot State Publisher ##
###########################
cd ~/Software/ROS/ros_catkin_ws/src
rm -rf robot_state_publisher
git clone https://github.com/ros/robot_state_publisher.git


# ###########
# ## Xacro ##
# ###########
# cd ~/Software/ROS/ros_catkin_ws/src
# rm -rf xacro
# git clone https://github.com/ros/xacro.git -b lunar-devel