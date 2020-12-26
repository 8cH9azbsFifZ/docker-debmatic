FROM debian:buster

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
    && apt install -y systemd udev kmod gnupg2 apt-transport-https wget \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9 \
    && bash -c 'echo "deb http://repos.azulsystems.com/debian stable main" > /etc/apt/sources.list.d/zulu.list' \
    && apt update \
    && apt install -y zulu-11 \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -q -O - https://www.debmatic.de/debmatic/public.key | apt-key add - \
    && bash -c 'echo "deb https://www.debmatic.de/debmatic stable main" > /etc/apt/sources.list.d/debmatic.list' \
    && apt update \
    && apt install -y debconf ipcalc net-tools rsync build-essential dkms \
    && RUNLEVEL=1 apt install -y lighttpd 
    #\
#    && RUNLEVEL=1 apt install -y pivccu-modules-dkms \
#    && RUNLEVEL=1 apt install -y debmatic \
#    && apt clean \
#    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get -y install pivccu-modules-dkms 
RUN apt-get -y install debmatic-lxc-host 

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*

STOPSIGNAL SIGRTMIN+3

VOLUME [ "/sys/fs/cgroup", "/run", "/run/lock", "/tmp" ]

CMD ["/lib/systemd/systemd"]
