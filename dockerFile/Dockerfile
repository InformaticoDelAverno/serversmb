FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -y samba runit inotify-tools -qq
RUN mkdir -p /shared
RUN chmod -R 777 /shared

COPY ./run/configsmb.sh /usr/local/bin/configsmb.sh
RUN chmod 744 /usr/local/bin/configsmb.sh
RUN ./usr/local/bin/configsmb.sh

RUN mkdir -p /etc/sv/smb

COPY ./servicesmb/smb.init /etc/sv/smb/run
COPY ./servicesmb/smb.stop /etc/sv/smb/finish
COPY ./run/run.sh /usr/local/bin/smb_setup

EXPOSE 445/tcp

ENTRYPOINT ["/usr/local/bin/smb_setup"]
