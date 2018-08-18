FROM timveil/docker-hadoop-base

LABEL maintainer="tjveil@gmail.com"

ENV SPARK_HOME /opt/spark

ARG SPARK_DOWNLOAD_DIR=/tmp/spark
ARG SPARK_VERSION=2.3.1

RUN curl -fSL https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop.tgz -o /tmp/spark.tgz \
    && mkdir -pv $SPARK_DOWNLOAD_DIR \
    && tar -xvf /tmp/spark.tgz -C $SPARK_DOWNLOAD_DIR --strip-components=1 \
    && mv -v $SPARK_DOWNLOAD_DIR /opt \
    && rm -rfv /tmp/spark.tgz