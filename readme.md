
## GPU Docker Image

This repository contains the Dockerfile and configuration for creating a GPU-enabled Docker image based on the NVIDIA CUDA 12.3.1 base image.

**Features**

* **Base Image:** NVIDIA CUDA 12.3.1 (Ubuntu 22.04) for GPU-accelerated computing.
* **SSH Server:**  OpenSSH server installed for remote access.
* **User Account:**  A non-root user (`docker_user`) is created for improved security.
* **Essential Tools:** `net-tools` and `btop` for network diagnostics and resource monitoring.

**Prerequisites**

* Docker installed
* NVIDIA GPU with compatible drivers
* NVIDIA Container Toolkit (`nvidia-docker2`)

**Building the Image**

1. Build the image:
   ```bash
   docker build -t gpu-image .
   ```

**Running the Container**

```bash
docker run -d --runtime nvidia -e NVIDIA_VISIBLE_DEVICES=all -p 2222:22 -v /mnt/docker_home:/home gpu-image
```

**Connecting via SSH**

```bash
ssh docker_user@localhost -p 2222
```
* **Password:** 123

**Notes**

* Ensure the mapping of `/mnt/docker_home` to your desired host directory.
* The default `docker_user` and password are provided for convenience. For production use, consider changing the password or using SSH keys for enhanced security.

**Docker Compose Deployment**

The included `docker-compose.yml` file provides configuration for a more streamlined deployment using Docker Compose.