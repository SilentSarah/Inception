# Inception

This is DevOps project that introduces students to the concept of portable services that run independently using **DOCKER!**


# What is docker?

**Docker** is a containerization tool desgined to store software in a special units called **Containers** for ease of deployment and access in any Operating System that supports Docker.

## Containers?

- Containerization, a Special functionallity of Docker and many other containerization programs, it **builds** and **packs**  and holds the software and it's dependencies in a single package called **image**. 
-  When this image is executed it turns into a **Container** and runs above an engine that controls the flow of data/resources (similar to a hypervisor but not quite) in this case it'll be the **Docker Engine**.
- Here's a small diagram that shows the structure of docker containers vs a virtual machine:
![Containers vs Virtual Machines](https://cloudblogs.microsoft.com/wp-content/uploads/sites/37/2019/07/Demystifying-containers_image1.png)
- As you can see in the diagram containers lack the basis of any Real/Virtualized System, **OS & Kernel**. All resource management happens between the **Engine** and **Host OS**.

## Dockerfile

- Dockerfiles consist of several instructions that control how the contained software and it's dependencies will be installed and ran.
- The following Example will feature the structure and several instructions that are necessary when docker builds the **image**:

   ```docker
   # FROM informs the builder of which base image your custom image will be built on and it's version
  FROM debian:bookworm
  # RUN runs a shell command, here where you might want to install your desired software and it's
  # dependencies
  RUN apt update && apt-get install -y -f mariadb-server
  # COPY copies files from the dockerfile directory into the image, here you might want to
  # copy configuration of some sort or a shell script that does the setup
  COPY DOCKER_FILE_DIR/Configuration.sql DIR_INSIDE_CONTAINER/Configuration.sql
  COPY DOCKER_FILE_DIR/Tool.sh DIR_INSIDE_CONTAINER/Tool.sh
  RUN bash /Tool.sh
  # EXPOSE exposes a port that only containers that are linked to the same docker network will be able
  #to access, possible webservice apps?
  EXPOSE 3306
  # CMD informs the builder of the command that will be first ran after the container turns on.
  CMD [ "mariadbd", "--bind-address=0.0.0.0" ]
   ```

## Docker Network

- Docker Network gives containers the ability to communicate with each other with restricted access from outside (Host OS, Internet).
- Two Important Network types are **Bridge/User Defined Bridge** & **Host** .
- **Bridge**: Creates a common **Gateway** and preforms **Automatic Subnetting** to all containers inside the network, also all containers benefit from **Docker DNS Resolver** which means all containers will be accessible inside the network using their hostnames (Container Name) instead of their IP addresses. 
- **Host**: In this mode the container will share the network with the host and can be accessible using the host IP address.
- Each mode has it's uses and downsides but in multi web services it's assumed that bridge mode works better than host.

