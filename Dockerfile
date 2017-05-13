FROM ubuntu:zesty

MAINTAINER Thomas Kilian

ENV DEBIAN_FRONTEND noninteractive
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
        strace \
        gdb \
        htop \
        nmap \
        man-db \
        openssh-server \
        python python-dev \
        python3 python3-dev \
        git \
        golang \
        rustc \
        cargo \
        locales

RUN locale-gen en_US.UTF-8
RUN useradd -m -d /home/me -s /bin/bash me

#########################################################
# create required folder for sshd
#########################################################
RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd

#########################################################
# install vundle and plugins for vim
#########################################################
RUN git clone https://github.com/gmarik/Vundle.vim.git /home/me/.vim/bundle/Vundle.vim
COPY target/vimrc /home/me/.vimrc
RUN chown -R me:me /home/me/.vim /home/me/.vimrc
RUN su me -c 'vim -E -u /home/me/.vimrc -S /home/me/.vim/vundle.vim +PluginInstall +qall > /dev/null' || true


#########################################################
# preparations for operation
#########################################################
EXPOSE 22 4000
CMD ["/usr/sbin/sshd", "-D"]
