###################################
############ TurtleBot ############
###################################

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

sudo echo
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#################################
## Activate our ROS virtualenv ##
#################################
source `which virtualenvwrapper.sh`
workon ros2



################
## Orocos BFL ##
################
installed=$(dpkg -s orocos-bfl-src | grep "ok installed")
if [ "" == "$installed" ]; then
  cd ~/Software
  wget -N http://people.mech.kuleuven.be/~tdelaet/bfl_tar/orocos-bfl-0.8.0-src.tar.bz2
  tar -xvf orocos-bfl-0.8.0-src.tar.bz2
  cd orocos-bfl-0.8.0
  mkdir build
  cd build
  cmake ..
  make -j $(nproc)
  sudo checkinstall --pkgname=orocos-bfl-src --pkgversion="0.8.0" -y
  echo ""
else
  echo "orocos-bfl-src is already installed... skipping"
fi


#########
## usb ##
#########
installed=$(dpkg -s libusb-1.0-0-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libusb-1.0-0-dev
  echo ""
else
  echo "libusb-1.0-0-dev is already installed... skipping"
fi


###########
## usb++ ##
###########
installed=$(dpkg -s libusb++-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libusb++-dev
  echo ""
else
  echo "libusb++-dev is already installed... skipping"
fi


###############
## sdl image ##
###############
installed=$(dpkg -s libsdl-image1.2-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libsdl-image1.2-dev
  echo ""
else
  echo "libsdl-image1.2-dev is already installed... skipping"
fi


#########
## sdl ##
#########
installed=$(dpkg -s libsdl1.2-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libsdl1.2-dev
  echo ""
else
  echo "libsdl1.2-dev is already installed... skipping"
fi


##########
## ftdi ##
##########
installed=$(dpkg -s libftdi-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libftdi-dev
  echo ""
else
  echo "libftdi-dev is already installed... skipping"
fi


###########
## spnav ##
###########
installed=$(dpkg -s libspnav-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libspnav-dev
  echo ""
else
  echo "libspnav-dev is already installed... skipping"
fi


###############
## bluetooth ##
###############
installed=$(dpkg -s libbluetooth-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libbluetooth-dev
  echo ""
else
  echo "libbluetooth-dev is already installed... skipping"
fi


###########
## cwiid ##
###########
installed=$(dpkg -s libcwiid-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libcwiid-dev
  echo ""
else
  echo "libcwiid-dev is already installed... skipping"
fi


##########
## Misc ##
##########
$SCRIPT_DIR/install_misc.sh
source ~/Software/ROS/ros_catkin_ws/devel_isolated/setup.bash
source ~/Software/ROS/misc_catkin_ws/devel_isolated/setup.bash


## Figure out a way to check if this is already done...
mkdir -p ~/Software/ROS/turtlebot_catkin_ws
cd ~/Software/ROS/turtlebot_catkin_ws

if [ ! -d src ]; then
  mkdir src
  cd src
  catkin_init_workspace |& tee install.txt
  cd ..
  wstool init -j8 src https://raw.githubusercontent.com/kentsommer/rocon/patch-1/rocon.rosinstall |& tee src.txt
  wstool merge -t src https://raw.githubusercontent.com/yujinrobot/yujin_tools/kinetic-devel/rosinstalls/kinetic/kobuki.rosinstall |& tee src.txt
  wstool merge -t src https://raw.githubusercontent.com/yujinrobot/yujin_tools/kinetic-devel/rosinstalls/kinetic/turtlebot.rosinstall |& tee src.txt
  wstool merge -t src https://raw.githubusercontent.com/yujinrobot/yujin_tools/kinetic-devel/rosinstalls/kinetic/kobuki_core.rosinstall |& tee src.txt
else
  rm -rf src/kobuki
fi

while true;
do
  wstool update -j8 -t src |& tee src.txt
  error=$(grep "ERROR" src.txt)
  if [ "" == "$error" ]; then
    rm -rf src.txt
    break
  fi
done

# Patch packages for Python 3
$SCRIPT_DIR/patch_turtlebot.sh

catkin_make_isolated

