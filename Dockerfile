FROM --platform=arm64 nvcr.io/nvidia/l4t-base:r36.2.0

RUN apt update && apt install locales
RUN apt install sudo curl -y
RUN sudo locale-gen en_US en_US.UTF-8
RUN sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

RUN sudo apt install software-properties-common -y
RUN sudo add-apt-repository universe

RUN sudo apt update && sudo apt install curl -y
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN sudo apt update -y && sudo apt upgrade -y
#ENV DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Kolkata DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN sudo apt install ros-humble-ros-base -y
RUN sudo apt install ros-dev-tools -y


