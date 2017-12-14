#############################
############ ROS ############
#############################
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

sudo echo
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


######################################
## Link Qt5 into our ROS virtualenv ##
######################################
$SCRIPT_DIR/setup_qt5.sh


#################################
## Activate our ROS virtualenv ##
#################################
source `which virtualenvwrapper.sh`
workon ros


#################
## Python Deps ##
#################
installed=$(pip3 list --format=columns | grep rosdep)
if [ "" == "$installed" ]; then
  pip install rosdep
  pip install rosinstall-generator
  pip install wstool
  pip install rosinstall
  echo ""
else
  echo "ROS python build dependencies are already installed... skipping"
fi


##############
## ROS DEPS ##
##############
installed=$(pip3 list --format=columns | grep empy)
if [ "" == "$installed" ]; then
  pip install empy
  echo ""
else
  echo "empy is already installed... skipping"
fi

installed=$(pip3 list --format=columns | grep nose)
if [ "" == "$installed" ]; then
  pip install nose
  echo ""
else
  echo "nose is already installed... skipping"
fi

installed=$(pip3 list --format=columns | grep numpy)
if [ "" == "$installed" ]; then
  pip install numpy
  echo ""
else
  echo "numpy is already installed... skipping"
fi

installed=$(pip3 list --format=columns | grep defusedxml)
if [ "" == "$installed" ]; then
  pip install defusedxml
  echo ""
else
  echo "defusedxml is already installed... skipping"
fi

installed=$(pip3 list --format=columns | grep netifaces)
if [ "" == "$installed" ]; then
  pip install netifaces
  echo ""
else
  echo "netifaces is already installed... skipping"
fi


#############
## URDFDOM ##
#############
installed=$(dpkg -s urdfdom-src | grep "ok installed")
if [ "" == "$installed" ]; then
  mkdir -p ~/Software/ROS/misc
  cd ~/Software/ROS/misc
  git clone https://github.com/ros/urdfdom.git
  cd urdfdom
  wget -N https://raw.githubusercontent.com/ros-gbp/urdfdom-release/release/indigo/urdfdom/package.xml
  mkdir build
  cd build
  cmake ..
  make -j $(nproc)
  sudo checkinstall --pkgname=urdfdom-src --pkgversion="1.0" -y
  echo ""
else
  echo "urdfdom-src is already installed... skipping"
fi


#####################
## URDFDOM Headers ##
#####################
installed=$(dpkg -s urdfdom-headers-src | grep "ok installed")
if [ "" == "$installed" ]; then
  mkdir -p ~/Software/ROS/misc
  cd ~/Software/ROS/misc
  git clone https://github.com/ros/urdfdom_headers.git
  cd urdfdom_headers
  wget -N https://raw.githubusercontent.com/ros-gbp/urdfdom_headers-release/release/indigo/urdfdom_headers/package.xml
  mkdir build
  cd build
  cmake ..
  make -j $(nproc)
  sudo checkinstall --pkgname=urdfdom-headers-src --pkgversion="1.0" -y
  echo ""
else
  echo "urdfdom-headers-src is already installed... skipping"
fi


#########
## VTK ##
#########
installed=$(dpkg -s vtk-src | grep "ok installed")
if [ "" == "$installed" ]; then
  cd ~/Software
  git clone https://gitlab.kitware.com/vtk/vtk.git VTK
  cd VTK
  git submodule update --init && git pull
  git checkout --track -b release origin/release
  git checkout v7.1.1
  mkdir build
  cd build
  cmake ..
  make -j $(nproc)
  sudo checkinstall --pkgname=vtk-src --pkgversion="7.1.1" -y
  echo ""
else
  echo "vtk-src is already installed... skipping"
fi


#########
## PCL ##
#########
installed=$(dpkg -s pcl-src | grep "ok installed")
if [ "" == "$installed" ]; then
  cd ~/Software 
  git clone https://github.com/PointCloudLibrary/pcl.git
  cd pcl
  git checkout tags/pcl-1.8.1
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j $(nproc)
  sudo checkinstall --pkgname=pcl-src --pkgversion="1.8.1" -y
  echo ""
else
  echo "pcl-src is already installed... skipping"
fi


#########
## ICU ##
#########
installed=$(dpkg -s icu-src | grep "ok installed")
if [ "" == "$installed" ]; then
  cd ~/Software 
  wget -N https://sourceforge.net/projects/icu/files/ICU4C/56.1/icu4c-56_1-src.tgz
  tar -xvf icu4c-56_1-src.tgz
  cd icu/source
  chmod +x runConfigureICU configure install-sh
  ./runConfigureICU Linux
  make -j $(nproc)
  sudo checkinstall --pkgname=icu-src --pkgversion="56-1" -y
  echo ""
else
  echo "icu-src is already installed... skipping"
fi


##############
## Gazebo 7 ##
##############
installed=$(dpkg -s gazebo7 | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
  wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
  sudo apt update
  sudo apt install -y gazebo7
  sudo apt install -y libgazebo7-dev
  echo ""
else
  echo "gazebo7 is already installed... skipping"
fi


#################
## ROS Kinetic ##
#################
installed=$(rosversion -d | grep kinetic)
if [ "" == "$installed" ]; then
  mkdir -p ~/Software/ROS/ros_catkin_ws
  cd ~/Software/ROS/ros_catkin_ws

  rosinstall_generator desktop_full --rosdistro kinetic --deps --wet-only --tar > kinetic-desktop-full-wet.rosinstall
  
  if [ ! -d src ]; then
    wstool init -j8 src kinetic-desktop-full-wet.rosinstall |& tee src.txt
  else
    rm -rf src/catkin
    rm -rf src/geometry2
    rm -rf src/ros_comm
    rm -rf src/robot_state_publisher
  fi

  while true;
  do
    wstool update -j8 -t src |& tee src.txt
    error=$(grep "ERROR" src.txt)
    if [ "" == "$error" ]; then
      break
    fi
  done

  # Patch packages for Python 3
  $SCRIPT_DIR/patch_ros.sh

  ./src/catkin/bin/catkin_make_isolated --cmake-args -DCMAKE_BUILD_TYPE=Release

  echo ""
else
  echo "ROS Kinetic is already installed... skipping"
fi