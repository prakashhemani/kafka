FROM hub.docker.hpecorp.net/shared/opensuse-base:42.1


ENV JDK_VERSION=1_8_0
ENV KAFKA_VERSION="0.10.1.0" SCALA_VERSION="2.11" 
ENV KAFKA_HOME="/opt/kafka_$SCALA_VERSION-$KAFKA_VERSION"

RUN zypper install -y wget tar java-$JDK_VERSION-openjdk-headless


RUN wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz"
RUN tar -xvzf kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz -C /opt 
RUN rm -f kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz

ADD start-kafka.sh /usr/bin/start-kafka.sh
RUN chmod a+x /usr/bin/start-kafka.sh 
CMD ["/usr/bin/start-kafka.sh"] 
 

