FROM alpine:3.3

MAINTAINER aurelien@derniercri.io

ENV PACKAGES make gcc musl-dev linux-headers

RUN apk add --update $PACKAGES && \
  cd /root && \
  wget http://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.03.11.tar.gz && \
  tar -xzf stress-ng-0.03.11.tar.gz && \
  cd stress-ng-0.03.11/ && \
  make install && \
  apk del $PACKAGES

ENTRYPOINT ["/usr/bin/stress-ng"]

CMD ["--help"]
