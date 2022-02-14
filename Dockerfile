# Container image that runs your code
FROM kalilinux/kali-rolling

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY -r ./patches /patches/
COPY patch_driver.sh /patch_driver.sh
COPY build.sh /build.sh  

# Code file to execute when the docker container starts up (`entrypoint.sh`)
RUN  /bin/bash -c './build.sh'