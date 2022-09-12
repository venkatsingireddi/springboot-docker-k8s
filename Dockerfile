FROM adoptopenjdk/openjdk11:alpine-jre

#ARG DB_HOST=host.docker.internal
ARG DB_HOST=127.0.0.1
ARG DB_NAME=emm
ARG POSTGRES_USER=postgres
ARG POSTGRES_PASSWORD=postgres

ENV DB_HOST=$DB_HOST \
    DB_NAME=$DB_NAME \
    POSTGRES_USER=$POSTGRES_USER \
    POSTGRES_PASSWORD=$POSTGRES_PASSWORD
    
ADD target/springboot-docker-k8s-0.0.1-SNAPSHOT.jar app.jar
RUN sed -e "s/[#]\?listen_addresses = .*/listen_addresses = '*'/g"
# -i '/etc/postgresql/14.4/main/postgresql.conf'
ENTRYPOINT ["java","-jar","app.jar"]