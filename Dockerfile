# Base Image: Use the specified NVIDIA CUDA image
FROM nvidia/cuda:12.3.1-base-ubuntu22.04

RUN apt-get update && apt-get install -y openssh-server
# install net-tools netstat btop
RUN apt-get -y install sudo
RUN apt-get install -y net-tools
RUN apt-get install -y btop
RUN apt-get install -y nvtop
RUN mkdir /var/run/sshd
# Set the root password to 123
RUN useradd -m -s /bin/bash docker_user
RUN echo 'docker_user:123' | chpasswd
# add docker_user to sudo group
RUN usermod -aG sudo docker_user
# Permit root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22
