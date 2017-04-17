FROM ubuntu:rolling

MAINTAINER Thomas Kilian

ENV DEBIAN_FRONTEND noninteractive
ENV TERM=xterm
ENV LANGUAGE en_US:en
ENV LANG en_US.UTF-8  
ENV LC_ALL en_US.UTF-8

RUN echo "Hello Docker! Hello World!"

#########################################################
# Install Packages
#########################################################
COPY target/sources.list /etc/apt/sources.list
RUN apt-get -q update --fix-missing && \
    apt-get -y upgrade && \
    apt-get -y install \
        vim \
        tmux \
        gcc \
        htop \
        nmap \
        man-db \
        openssh-server \
        python python-dev \
        python3 python3-dev \
        git \
        golang \
        rustc

RUN locale-gen en_US.UTF-8

RUN useradd -ms /bin/bash me

#########################################################
# create required folder for sshd
#########################################################
RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd

#########################################################
# preparations for operation
#########################################################
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
