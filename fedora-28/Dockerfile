FROM remyj38/fedora-systemd:28

RUN dnf -y upgrade && dnf clean all

RUN dnf -y install ansible && dnf clean all

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]
