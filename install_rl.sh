#############################
############ ROS ############
#############################
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

sudo echo
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#################################
## Activate our ROS virtualenv ##
#################################
source `which virtualenvwrapper.sh`
workon ros

cd ~/Software


#############
## PyTorch ##
#############
installed=$(pip2 list --format=columns | grep torch)
if [ "" == "$installed" ]; then
  pip install http://download.pytorch.org/whl/cu80/torch-0.3.0.post4-cp27-cp27mu-linux_x86_64.whl 
  pip install torchvision
  echo ""
else
  echo "pytorch is already installed... skipping"
fi


################
## Tensorflow ##
################
installed=$(pip2 list --format=columns | grep tensorflow-gpu)
if [ "" == "$installed" ]; then
  pip install tensorflow-gpu
  echo ""
else
  echo "tensorflow-gpu is already installed... skipping"
fi


#########
## Gym ##
#########
installed=$(pip2 list --format=columns | grep gym)
if [ "" == "$installed" ]; then
  git clone https://github.com/openai/gym.git
  cd gym
  pip install -e '.[all]'
  cd ..
  echo ""
else
  echo "Gym is already installed... skipping"
fi


###############
## Baselines ##
###############
installed=$(pip2 list --format=columns | grep baselines)
if [ "" == "$installed" ]; then
  git clone https://github.com/openai/baselines.git
  cd baselines
  pip install -e .
  cd ..
  echo ""
else
  echo "Baselines is already installed... skipping"
fi


#################
## TensorForce ##
#################
installed=$(pip2 list --format=columns | grep tensorforce)
if [ "" == "$installed" ]; then
  pip install tensorforce
  echo ""
else
  echo "TensorForce is already installed... skipping"
fi
