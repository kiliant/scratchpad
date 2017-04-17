FROM ubuntu:rolling

MAINTAINER Thomas Kilian

ENV TERM=xterm

RUN echo "Hello Docker! Hello World!"

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

RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
