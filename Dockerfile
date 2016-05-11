FROM debian:jessie

MAINTAINER aurelien@derniercri.io

ENV PACKAGES make gcc build-essential wget
ENV VERSION 0.06.01

RUN apt-get update && \
  apt-get install -yq $PACKAGES && \
  cd /root && \
  wget --no-check-certificate https://github.com/Lorel/stress-ng/archive/debug.tar.gz && \
  tar -xzf debug.tar.gz && \
  cd stress-ng-debug/ && \
  make install && \
  cd .. && \
  rm -rfv debug* stress-ng-debug && \
  apt-get autoremove --purge -yq $PACKAGES && \
  apt-get clean

ENTRYPOINT ["/usr/bin/stress-ng"]

CMD ["--help"]
