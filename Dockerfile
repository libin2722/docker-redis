#
# MAINTAINER        Terry.Li<libin2722@sohu.com>
# DOCKER-VERSION    1.12.1
# REDIS-VERSION     3.2.3
#
# Dockerizing Redis: Dockerfile for building Redis images
#
FROM       daocloud.io/libin2722/centos:latest
MAINTAINER Terry.Li,<libin2722@sohu.com>

ENV REDIS_VERSION 3.2.3
ENV REDIS_HOME /opt/redis-${REDIS_VERSION}

RUN curl -O http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz && \
    tar xzf redis-${REDIS_VERSION}.tar.gz -C /opt && \
    cd ${REDIS_HOME} && \
    make -j4

COPY redis.conf ${REDIS_HOME}/redis.conf

RUN cp ${REDIS_HOME}/src/redis-server /usr/local/bin

ENTRYPOINT ["redis-server", "/opt/redis-3.2.3/redis.conf"]

EXPOSE 6379
