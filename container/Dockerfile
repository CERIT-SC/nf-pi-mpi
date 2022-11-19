FROM debian as builder

RUN apt update && apt install -y --no-install-recommends \
                        g++ \
                        libopenmpi-dev \
                        && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY pi.cc /src/pi.cc
RUN mpic++ /src/pi.cc -o /pi


FROM debian

RUN apt update && apt install -y --no-install-recommends \
                        openmpi-bin \
                        openssh-server \
                        openssh-client \
                        && apt-get clean && rm -rf /var/lib/apt/lists/*
# Add priviledge separation directoy to run sshd as root.
RUN mkdir -p /var/run/sshd

RUN useradd -m user
WORKDIR /home/user
# Allow OpenSSH to talk to containers without asking for confirmation and
# disable file permissions checks.
RUN sed -i 's/[ #]\(.*StrictHostKeyChecking \).*/ \1no/g' /etc/ssh/ssh_config && \
    echo "    UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config && \
    sed -i "s/[ #]\(.*Port \).*/ \12222/g" /etc/ssh/ssh_config && \
    echo "PidFile /tmp/sshd.pid\nHostKey /home/user/.ssh/id_rsa\nStrictModes no\nPort 2222\nUsePAM no\n" > /etc/ssh/sshd_config && chown -R user /etc/ssh
COPY --from=builder /pi /home/user/pi

USER 1000

CMD /usr/sbin/sshd -e -D
