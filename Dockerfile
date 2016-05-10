FROM debian:jessie

MAINTAINER aurelien@derniercri.io

ENV PACKAGES make gcc build-essential wget
ENV VERSION 0.06.01

RUN apt-get update && \
  apt-get install -yq $PACKAGES && \
  cd /root && \
  wget http://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-$VERSION.tar.gz && \
  tar -xzf stress-ng-$VERSION.tar.gz && \
  cd stress-ng-$VERSION/ && \
  make install && \
  cd .. && \
  rm -rfv stress-ng-$VERSION* && \
  apt-get autoremove --purge -yq $PACKAGES && \
  apt-get clean

ENTRYPOINT ["/usr/bin/stress-ng"]

CMD ["--help"]
