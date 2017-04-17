FROM ubuntu

MAINTAINER Thomas Kilian

ENV TERM=xterm

RUN echo "Hello Docker! Hello World!"

RUN apt-get -q=2 update

RUN apt-get -q=2 install \
        vim \
        tmux \
        gcc \
        htop \
        nmap \
        man-db \
        openssh-server \
        python2 python-dev \
        python3 python3-dev \
        git \
        rustc \
        golang \

RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
