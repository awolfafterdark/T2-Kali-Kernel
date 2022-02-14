# Container image that runs your code
FROM kalilinux/kali-rolling

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY ./patches /patches/
COPY patch_driver.sh /patch_driver.sh
COPY config-5.14.0-kali4-amd64 /config-5.14.0-kali4-amd64
COPY build.sh /build.sh 

# Code file to execute when the docker container starts up (`entrypoint.sh`)
RUN  /bin/bash -c 'cd / && ./build.sh'