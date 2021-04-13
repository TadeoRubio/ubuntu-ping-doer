# Docker image with Ubuntu 20.04 & elements to do ping.
# BY TADEO RUBIO
FROM ubuntu:20.04

# UPDATE APT-GET
RUN apt update -y && apt upgrade -y

# INSTALL PING
RUN apt install iputils-ping -y 

# INSTALL MTR
ENV TZ=America/Mexico_City
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y install mtr

# Host & Time between ping requests (seconds).
ENV HOST_TO_PING google.com
ENV TIME_B_PINGS 5
ADD do.sh .

CMD [ "./do.sh"]