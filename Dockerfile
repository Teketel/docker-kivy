# kivy&buildozer android with python 2.7 

# From Android Development Environment. 
# Contains: 
#   OpenJDK 7
#   Android SDK r22.3
#   Android NDK r9b
#   Ant 1.9.2
#   Maven 3.1.1
#   Gradle 1.9
FROM    ubuntu

# Add i386 architecture
dpkg --add-architecture i386

# Update repository
RUN     apt-get -y update && apt-get -y upgrade

# Install necessary system packages
RUN     apt-get install -y build-essential mercurial git python2.7 \
                           python-setuptools python-dev \
                           libsdl-image1.2-dev libsdl-mixer1.2-dev \
                           libsdl-ttf2.0-dev libsmpeg-dev libsdl1.2-dev \
                           libportmidi-dev libswscale-dev libavformat-dev \
                           libavcodec-dev zlib1g-dev wget curl mc

# Bootstrap a current Python environment
RUN     apt-get remove --purge -y python-virtualenv python-pip
RUN     easy_install-2.7 -U pip
RUN     pip2.7 install -U virtualenv

# Install current version of Cython
RUN     apt-get remove --purge -y cython
RUN     pip2.7 install -U cython

# Install other PyGame dependencies
RUN     apt-get remove --purge -y python-numpy
RUN     pip2.7 install -U numpy

# Install PyGame
RUN     apt-get remove --purge python-pygame
RUN     hg clone https://bitbucket.org/pygame/pygame
RUN     cd pygame && python2.7 setup.py build && python2.7 setup.py install && cd .. && rm -rf pygame

# Install buildozer
pip install --upgrade buildozer

# Install buildozer android target dependencies
apt-get install -y build-essential ccache git lib32stdc++6 lib32z1 lib32z1-dev python2.7 python2.7-dev openjdk-7-jdk unzip zlib1g-dev
# Install kivy
pip install kivy
