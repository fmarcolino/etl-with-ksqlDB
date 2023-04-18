FROM confluentinc/ksqldb-server:0.28.2

USER root:root
RUN yum install -y unzip

ADD plugins/*.tar.gz /usr/share/confluent-hub-components/
COPY plugins/*.jar /usr/share/confluent-hub-components/

COPY plugins/*.zip /usr/share/confluent-hub-components/

RUN unzip /usr/share/confluent-hub-components/\*.zip -d /usr/share/confluent-hub-components/
RUN rm /usr/share/confluent-hub-components/*.zip
