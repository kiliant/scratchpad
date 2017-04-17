FROM ubuntu

ENV TERM=xterm

MAINTAINER Thomas Kilian

RUN echo "Hello Docker!"

RUN apt-get -q=2 update

RUN apt-get -q=2 install \
        vim \
        tmux \
        gcc \
        htop \
        man-db \
        openssh-server

RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
