# Base Image: Use the specified NVIDIA CUDA image
FROM nvidia/cuda:12.3.1-base-ubuntu22.04

# install package
RUN apt-get update && apt-get install -y \
       openssh-server \
       sudo \
       net-tools \
       btop \
       nvtop \
       curl && \
       apt-get clean

# add user to ssh
RUN mkdir /var/run/sshd
# Set the root password to 123
RUN useradd -m -s /bin/bash docker_user
RUN echo 'docker_user:123' | chpasswd
# create a home directory for docker_user
# add docker_user to sudo group
RUN usermod -aG sudo docker_user
# Permit root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22

