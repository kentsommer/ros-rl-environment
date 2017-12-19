##############################
############ MISC ############
##############################

source ~/Software/ROS/ros_catkin_ws/devel_isolated/setup.bash
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

sudo echo
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


if [ ! -d ~/Software/ROS/misc_catkin_ws/src ]; then
  mkdir -p ~/Software/ROS/misc_catkin_ws/src
  cd ~/Software/ROS/misc_catkin_ws/src
  catkin_init_workspace |& tee install.txt
fi

cd ~/Software/ROS/misc_catkin_ws


############
## Sophus ##
############
if [ ! -d src/sophus ]; then
  cd src
  git clone https://github.com/stonier/sophus.git -b indigo
  cd ..
else
  echo "src folder exists... will update now!"
  cd src/sophus
  git pull
  cd ../..
fi 


###############
## uuid msgs ##
###############
if [ ! -d src/unique_identifier ]; then
  cd src
  git clone https://github.com/ros-geographic-info/unique_identifier.git
  cd ..
else
  echo "src folder exists... will update now!"
  cd src/unique_identifier
  git pull
  cd ../..
fi 


#########
## joy ##
#########
if [ ! -d src/joystick_drivers ]; then
  cd src
  git clone https://github.com/ros-drivers/joystick_drivers.git
  cd ..
else
  echo "src folder exists... will update now!"
  cd src/joystick_drivers
  git pull
  cd ../..
fi 


####################
## ar_track_alvar ##
####################
if [ ! -d src/ar_track_alvar ]; then
  cd src
  git clone https://github.com/ros-perception/ar_track_alvar.git -b kinetic-devel
  cd ..
else
  echo "src folder exists... will update now!"
  cd src/ar_track_alvar
  git pull
  cd ../..
fi 


#####################
## navigation msgs ##
#####################
if [ ! -d src/navigation_msgs ]; then
  cd src
  git clone https://github.com/ros-planning/navigation_msgs.git -b jade-devel
  cd ..
else
  echo "src folder exists... will update now!"
  cd src/navigation_msgs
  git pull
  cd ../..
fi 


################
## navigation ##
################
if [ ! -d src/navigation ]; then
  cd src
  git clone https://github.com/ros-planning/navigation.git -b kinetic-devel
  cd ..
else
  echo "src folder exists... will update now!"
  cd src/navigation
  git pull
  cd ../..
fi 


#################
## common msgs ##
#################
if [ ! -d src/common_msgs ]; then
  cd src
  git clone https://github.com/ros/common_msgs.git -b jade-devel
  cd ..
else
  echo "src folder exists... will update now!"
  cd src/common_msgs
  git pull
  cd ../..
fi

###############################
## depth image to laser scan ##
###############################
if [ ! -d src/depthimage_to_laserscan ]; then
  cd src
  git clone https://github.com/ros-perception/depthimage_to_laserscan.git -b indigo-devel
  cd ..
else
  echo "src folder exists... will update now!"
  cd src/depthimage_to_laserscan
  git pull
  cd ../..
fi

catkin_make_isolated