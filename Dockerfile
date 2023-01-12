FROM jrottenberg/ffmpeg
MAINTAINER Aleksey Krivoshein <a.krivoshein@gmail.com>
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh $@
