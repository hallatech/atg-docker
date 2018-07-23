FROM oraclelinux:7-slim

MAINTAINER hallatech <admin@hallatech.net>

ENV JAVA_PKG=jdk-8u181-linux-x64.tar.gz \
    JAVA_HOME=/usr/java/default

ADD $JAVA_PKG /usr/java/

RUN export JAVA_DIR=$(ls -1 -d /usr/java/*) && \
    ln -s $JAVA_DIR /usr/java/latest && \
    ln -s $JAVA_DIR /usr/java/default
    