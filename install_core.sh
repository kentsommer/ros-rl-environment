sudo echo
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


######################
## Build Essentials ##
######################
installed=$(dpkg -s build-essential | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y build-essential
  echo ""
else
  echo "build-essential is already installed... skipping"
fi


###########
## CMake ##
###########
installed=$(dpkg -s cmake | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y cmake
  echo ""
else
  echo "cmake is already installed... skipping"
fi


#########
## Git ##
#########
installed=$(dpkg -s git | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y git
  echo ""
else
  echo "git is already installed... skipping"
fi


##############
## Plymouth ##
##############
installed=$(dpkg -s plymouth-x11 | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y plymouth-x11
  echo ""
else
  echo "plymouth-x11 is already installed... skipping"
fi


#########
## PIP ##
#########
installed=$(dpkg -s python-pip | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y python-pip
  sudo pip2 install --upgrade pip
  echo ""
else
  echo "python-pip is already installed... skipping"
fi


###############
## Mercurial ##
###############
installed=$(dpkg -s mercurial | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y mercurial
  echo ""
else
  echo "mercurial is already installed... skipping"
fi


##########
## Flex ##
##########
installed=$(dpkg -s flex | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y flex
  echo ""
else
  echo "flex is already installed... skipping"
fi


###########
## Bison ##
###########
installed=$(dpkg -s bison | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y bison
  echo ""
else
  echo "bison is already installed... skipping"
fi


##########
## Curl ##
##########
installed=$(dpkg -s libcurl4-openssl-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libcurl4-openssl-dev
  echo ""
else
  echo "libcurl4-openssl-dev is already installed... skipping"
fi


#########
## lz4 ##
#########
installed=$(dpkg -s liblz4-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y liblz4-dev
  echo ""
else
  echo "liblz4-dev is already installed... skipping"
fi


###########
## BZip2 ##
###########
installed=$(dpkg -s libbz2-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libbz2-dev
  echo ""
else
  echo "libbz2-dev is already installed... skipping"
fi


##########
## jpeg ##
##########
installed=$(dpkg -s libjpeg-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libjpeg-dev
  echo ""
else
  echo "libjpeg-dev is already installed... skipping"
fi


#########
## png ##
#########
installed=$(dpkg -s libpng12-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libpng12-dev
  echo ""
else
  echo "libpng12-dev is already installed... skipping"
fi


##########
## fltk ##
##########
installed=$(dpkg -s libfltk1.3-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libfltk1.3-dev
  echo ""
else
  echo "libfltk1.3-dev is already installed... skipping"
fi


############
## assimp ##
############
installed=$(dpkg -s libassimp-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libassimp-dev
  echo ""
else
  echo "libassimp-dev is already installed... skipping"
fi


###########
## flann ##
###########
installed=$(dpkg -s libflann-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libflann-dev
  echo ""
else
  echo "libflann-dev is already installed... skipping"
fi


##############
## avdevice ##
##############
installed=$(dpkg -s libavdevice-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libavdevice-dev
  echo ""
else
  echo "libavdevice-dev is already installed... skipping"
fi


#############
## avcodec ##
#############
installed=$(dpkg -s libavcodec-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libavcodec-dev
  echo ""
else
  echo "libavcodec-dev is already installed... skipping"
fi


##############
## avformat ##
##############
installed=$(dpkg -s libavformat-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libavformat-dev
  echo ""
else
  echo "libavformat-dev is already installed... skipping"
fi


###############
## python-tk ##
###############
installed=$(dpkg -s python-tk | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y python-tk
  echo ""
else
  echo "python-tk is already installed... skipping"
fi


###########
## Boost ##
###########
installed=$(dpkg -s libboost-all-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libboost-all-dev
  # Hacky fix to get portions of ROS to find boost_py3
  # sudo ln -s /usr/lib/x86_64-linux-gnu/libboost_python-py35.so /usr/lib/x86_64-linux-gnu/libboost_python3.so
  echo ""
else
  echo "libboost-all-dev is already installed... skipping"
fi


####################
## console-bridge ##
####################
installed=$(dpkg -s libconsole-bridge-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libconsole-bridge-dev
  echo ""
else
  echo "libconsole-bridge-dev is already installed... skipping"
fi


###########
## gtest ##
###########
installed=$(dpkg -s libgtest-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libgtest-dev
  echo ""
else
  echo "libgtest-dev is already installed... skipping"
fi


##########
## poco ##
##########
installed=$(dpkg -s libpoco-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libpoco-dev
  echo ""
else
  echo "libpoco-dev is already installed... skipping"
fi


############
## eigen3 ##
############
installed=$(dpkg -s libeigen3-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libeigen3-dev
  sudo ln -s /usr/include/eigen3/Eigen /usr/include/Eigen
  sudo ln -s /usr/include/eigen3/unsupported /usr/include/unsupported
  echo ""
else
  echo "libeigen3-dev is already installed... skipping"
fi


#############
## tinyxml ##
#############
installed=$(dpkg -s libtinyxml-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libtinyxml-dev
  echo ""
else
  echo "libtinyxml-dev is already installed... skipping"
fi


##############
## tinyxml2 ##
##############
installed=$(dpkg -s libtinyxml2-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libtinyxml2-dev
  echo ""
else
  echo "libtinyxml2-dev is already installed... skipping"
fi


########
## xt ##
########
installed=$(dpkg -s libxt-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libxt-dev
  echo ""
else
  echo "libxt-dev is already installed... skipping"
fi


###########
## qhull ##
###########
installed=$(dpkg -s libqhull-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libqhull-dev
  echo ""
else
  echo "libqhull-dev is already installed... skipping"
fi


##########
## uuid ##
##########
installed=$(dpkg -s uuid-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y uuid-dev
  echo ""
else
  echo "uuid-dev is already installed... skipping"
fi


##############
## yaml-cpp ##
##############
installed=$(dpkg -s libyaml-cpp-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libyaml-cpp-dev
  echo ""
else
  echo "libyaml-cpp-dev is already installed... skipping"
fi


############
## xmlrpc ##
############
installed=$(dpkg -s libxmlrpcpp-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libxmlrpcpp-dev
  echo ""
else
  echo "libxmlrpcpp-dev is already installed... skipping"
fi


###########
## gtk-3 ##
###########
installed=$(dpkg -s libgtk-3-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libgtk-3-dev
  sudo ln -s /usr/include/gtk-2.0/gtk /usr/include/gtk
  sudo ln -s /usr/include/gtk-2.0/gdk /usr/include/gdk
  echo ""
else
  echo "libgtk-3-dev is already installed... skipping"
fi


#############
## gtkmm-3 ##
#############
installed=$(dpkg -s libgtkmm-3.0-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libgtkmm-3.0-dev
  echo ""
else
  echo "libgtkmm-3.0-dev is already installed... skipping"
fi


#########
## ogg ##
#########
installed=$(dpkg -s libogg-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libogg-dev
  echo ""
else
  echo "libogg-dev is already installed... skipping"
fi


############
## theora ##
############
installed=$(dpkg -s libtheora-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libtheora-dev
  echo ""
else
  echo "libtheora-dev is already installed... skipping"
fi


##############
## openni 2 ##
##############
installed=$(dpkg -s libopenni2-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libopenni2-dev
  echo ""
else
  echo "libopenni2-dev is already installed... skipping"
fi


############
## openni ##
############
installed=$(dpkg -s libopenni-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libopenni-dev
  echo ""
else
  echo "libopenni-dev is already installed... skipping"
fi


#################
## collada-dom ##
#################
installed=$(dpkg -s libcollada-dom2.4-dp-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libcollada-dom2.4-dp-dev
  echo ""
else
  echo "libcollada-dom2.4-dp-dev is already installed... skipping"
fi

##########
## hdf5 ##
##########
installed=$(dpkg -s libhdf5-dev | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y libhdf5-dev
  echo ""
else
  echo "libhdf5-dev is already installed... skipping"
fi


##########
## Swig ##
##########
installed=$(dpkg -s swig | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y swig
  echo ""
else
  echo "swig is already installed... skipping"
fi


############
## rosdep ##
############
installed=$(dpkg -s python-rosdep | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y python-rosdep
  echo ""
else
  echo "python-rosdep is already installed... skipping"
fi

##########################
## rosinstall-generator ##
##########################
installed=$(dpkg -s python-rosinstall-generator | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y python-rosinstall-generator
  echo ""
else
  echo "python-rosinstall-generator is already installed... skipping"
fi


############
## wstool ##
############
installed=$(dpkg -s python-wstool | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y python-wstool
  echo ""
else
  echo "python-wstool is already installed... skipping"
fi


################
## rosinstall ##
################
installed=$(dpkg -s python-rosinstall | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y python-rosinstall
  echo ""
else
  echo "python-rosinstall is already installed... skipping"
fi


###########
## rospy ##
###########
installed=$(dpkg -s python-rospy | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y python-rospy
  echo ""
else
  echo "python-rospy is already installed... skipping"
fi


###########
## genpy ##
###########
installed=$(dpkg -s python-genpy | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y python-genpy
  echo ""
else
  echo "python-genpy is already installed... skipping"
fi


############
## roslib ##
############
installed=$(dpkg -s python-roslib | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y python-roslib
  echo ""
else
  echo "python-roslib is already installed... skipping"
fi


###################
## rosgraph_msgs ##
###################
installed=$(dpkg -s python-rosgraph-msgs | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y python-rosgraph-msgs
  echo ""
else
  echo "python-rosgraph-msgs is already installed... skipping"
fi


##################
## checkinstall ##
##################
installed=$(dpkg -s checkinstall | grep "ok installed")
if [ "" == "$installed" ]; then
  sudo apt install -y checkinstall
  echo ""
else
  echo "checkinstall is already installed... skipping"
fi


##########################
## VirtualEnv & Wrapper ##
##########################
installed=$(pip2 list --format=columns | grep virtualenv)
if [ "" == "$installed" ]; then
  sudo pip2 install virtualenv
  sudo pip2 install virtualenvwrapper

  echo '' >> ~/.bashrc
  echo '################' >> ~/.bashrc
  echo '## VirtualEnv ##' >> ~/.bashrc
  echo '################' >> ~/.bashrc
  echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc
  echo 'export PROJECT_HOME=$HOME/Devel' >> ~/.bashrc
  echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc
  source ~/.bashrc
  echo ""
else
  echo "virtualenv is already installed... skipping"
fi


############
## Chrome ##
############
installed=$(dpkg -s google-chrome-stable | grep "ok installed")
if [ "" == "$installed" ]; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  sudo apt update
  sudo apt install -y google-chrome-stable
  echo ""
else
  echo "google-chrome-stable is already installed... skipping"
fi


####################
## Nvidia Drivers ##
####################
installed=$(nvidia-smi | grep Version)
if [ "" == "$installed" ]; then
  sudo add-apt-repository -y ppa:graphics-drivers/ppa
  sudo apt update
  sudo apt -y full-upgrade
  sudo apt install -y nvidia-387-dev nvidia-settings nvidia-opencl-icd-387
  echo ""
else
  echo "nvidia driver is already installed... skipping"
fi


##################
## Sublime Text ##
##################
installed=$(dpkg -s sublime-text | grep "ok installed")
if [ "" == "$installed" ]; then
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  sudo apt install -y apt-transport-https
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt update
  sudo apt install -y sublime-text
  echo ""
else
  echo "sublime-text is already installed... skipping"
fi


############
## Cuda 8 ##
############
installed=$(nvcc --version | grep release)
if [ "" == "$installed" ]; then
  cd ~/Downloads
  wget -N https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
  chmod +x cuda_8.0.61_375.26_linux-run
  sudo ./cuda_8.0.61_375.26_linux-run --silent --toolkit

  echo '' >> ~/.bashrc
  echo '##########' >> ~/.bashrc
  echo '## CUDA ##' >> ~/.bashrc
  echo '##########' >> ~/.bashrc
  echo 'export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}' >> ~/.bashrc
  echo 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
  source ~/.bashrc
  echo ""
else
  echo "cuda is already installed... skipping"
fi


#########
## Qt5 ##
#########
installed=$(qmake --version | grep 5.9.3)
if [ "" == "$installed" ]; then
  mkdir -p ~/Software/Qt5
  cd ~/Software/Qt5
  wget -N https://raw.githubusercontent.com/kentsommer/ros-rl-environment/master/extract-qt-installer
  wget -N https://raw.githubusercontent.com/kentsommer/ros-rl-environment/master/install-qt-5.9.3
  chmod +x extract-qt-installer
  chmod +x install-qt-5.9.3
  ./install-qt-5.9.3

  echo '' >> ~/.bashrc
  echo '#########' >> ~/.bashrc
  echo '## Qt5 ##' >> ~/.bashrc
  echo '#########' >> ~/.bashrc
  echo 'export PATH=~/Software/Qt5/Qt/5.9.3/gcc_64/bin${PATH:+:${PATH}}' >> ~/.bashrc
  source ~/.bashrc
  echo ""
else
  echo "Qt 5 is already installed... skipping"
fi


#######################################
## Make Virtual Env for use later... ##
#######################################
source `which virtualenvwrapper.sh`
if [ ! -d ~/.virtualenvs/ros ]; then
  mkvirtualenv ros -p python2 --system-site-packages
else
  echo "ROS virtualenv already exists!"
fi 


##############
## Finished ##
##############
echo ""
echo ""
echo "INSTALL FINISHED!"