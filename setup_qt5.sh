sudo echo
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


#########
## SIP ##
#########
installed=$(dpkg -s python3-sip-src | grep "ok installed")
if [ "" == "$installed" ]; then
  cd ~/Software
  wget -N https://downloads.sourceforge.net/project/pyqt/sip/sip-4.19.6/sip-4.19.6.tar.gz
  tar -xvf sip-4.19.6.tar.gz
  cd sip-4.19.6
  python3 configure.py 
  make -j $(nproc)
  sudo checkinstall --pkgname=python3-sip-src --pkgversion="4.19.6" -y
  echo ""
else
  echo "python3-sip-src is already installed... skipping"
fi


###########
## PyQt5 ##
###########
installed=$(dpkg -s python3-pyqt5-src | grep "ok installed")
if [ "" == "$installed" ]; then
  cd ~/Software
  wget -N https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.9.2/PyQt5_gpl-5.9.2.tar.gz
  tar -xvf PyQt5_gpl-5.9.2.tar.gz
  cd PyQt5_gpl-5.9.2
  python3 configure.py --confirm-license
  make -j $(nproc)
  sudo checkinstall --pkgname=python3-pyqt5-src --pkgversion="5.9.2" -y
  echo ""
else
  echo "python3-pyqt5-src is already installed... skipping"
fi


#################################
## Activate our ROS virtualenv ##
#################################
source `which virtualenvwrapper.sh`
workon ros


###########################################
## Symlink PyQt5 into our ROS virtualenv ##
###########################################
libs=(PyQt5 sip.so sipconfig.py sipdistutils.py sip.pyi)

python_version=python$(python -c "import sys; print (str(sys.version_info[0])+'.'+str(sys.version_info[1]))")
var=( $(which -a ${python_version}) )

if [ ${#var[@]} -lt 2 ]; then
    echo "could not find system install of ${python_version}: unable to link PyQt components" >&2
else
    get_python_lib_cmd="from distutils.sysconfig import get_python_lib; print (get_python_lib())"
    lib_virtualenv_path=$(${var[0]} -c "${get_python_lib_cmd}")
    deactivate
    lib_system_path=$(${var[-1]} -c "${get_python_lib_cmd}")
    workon ros
    echo $lib_system_path
    for lib in ${libs[@]}
    do
        if [ ! -e "${lib_virtualenv_path}/${lib}" ]; then
            ln -s "${lib_system_path}/${lib}" "${lib_virtualenv_path}/${lib}"
        fi
    done
fi

echo "Finished linking Qt5 into ros virtualenv"