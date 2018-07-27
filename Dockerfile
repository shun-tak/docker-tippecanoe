FROM alpine:3.8

MAINTAINER shun-tak <shun.tak221@gmail.com>

ARG TIPPECANOE_RELEASE="1.30.1"

WORKDIR /root

RUN apk add --no-cache g++ make bash libgcc libstdc++ sqlite-libs sqlite-dev zlib-dev \
 && wget https://github.com/mapbox/tippecanoe/archive/${TIPPECANOE_RELEASE}.tar.gz \
 && tar -zxf ${TIPPECANOE_RELEASE}.tar.gz \
 && rm ${TIPPECANOE_RELEASE}.tar.gz \
 && cd tippecanoe-${TIPPECANOE_RELEASE} \
 && make -j`nproc` \
 && make install \
 && cd /root \
 && rm -rf /root/tippecanoe-${TIPPECANOE_RELEASE} \
 && apk del g++ make bash sqlite-dev

CMD tippecanoe -v
