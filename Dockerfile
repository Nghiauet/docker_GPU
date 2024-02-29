# Base Image: Use the specified NVIDIA CUDA image
FROM nvidia/cuda:12.3.1-base-ubuntu22.04

RUN apt-get update && apt-get install -y openssh-server
# install net-tools netstat btop
RUN apt-get install -y net-tools
RUN apt-get install -y btop
RUN mkdir /var/run/sshd
RUN useradd -m -s /bin/bash docker_user
RUN echo 'docker_user:123' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
