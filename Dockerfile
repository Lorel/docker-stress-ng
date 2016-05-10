FROM alpine:3.3

MAINTAINER aurelien@derniercri.io

ENV PACKAGES make gcc musl-dev linux-headers
ENV VERSION 0.03.16

RUN apk add --update $PACKAGES && \
  cd /root && \
  wget http://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-$VERSION.tar.gz && \
  tar -xzf stress-ng-$VERSION.tar.gz && \
  cd stress-ng-$VERSION/ && \
  make install && \
  apk del $PACKAGES

ENTRYPOINT ["/usr/bin/stress-ng"]

CMD ["--help"]
