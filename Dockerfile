FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive


# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    software-properties-common

# Set up ROS2 sources
RUN curl -sSL http://repo.ros2.org/repos.key | apt-key add - && \
    add-apt-repository "deb http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main"

# Install ROS2
RUN apt-get update && apt-get install -y \
    ros-humble-desktop \
    python3-rosdep \
    python3-pip \
    liboctomap-dev \
    libfcl-dev \
    python3-colcon-common-extensions

# Source ROS2 setup script
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Install VNC server and other necessary tools
RUN apt-get install -y \
    x11vnc \
    xvfb \
    xfce4 \
    xfce4-goodies \
    x11-apps

# Set up VNC server
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd

# Expose VNC port
EXPOSE 5900

# Install RViz2
RUN apt-get update && apt-get install -y \
    ros-humble-rviz2 \
    ros-humble-tf-transformations \
    ros-humble-urdf-launch \
    python3-colcon-clean

#RUN pip install python-fcl

# Expose necessary ports
EXPOSE 5900
EXPOSE 8080

# Set the DISPLAY environment variable

RUN echo "export DISPLAY=:20" >> ~/.bashrc
# Set up entrypoint script to start VNC server and VS Code Server
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
