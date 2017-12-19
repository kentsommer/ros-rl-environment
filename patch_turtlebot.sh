sudo echo
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#######################################
## Pull in patched Turtlebot ROS src ##
#######################################

############
## Kobuki ##
############
cd ~/Software/ROS/turtlebot_catkin_ws/src
rm -rf kobuki
git clone https://github.com/kentsommer/kobuki.git -b patch-1