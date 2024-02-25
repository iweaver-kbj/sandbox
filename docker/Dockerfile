FROM bellsoft/liberica-openjdk-alpine:17

ENTRYPOINT []

USER root

# set timezone.
RUN apk add tzdata && ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime && date


# install application.
ENV APP_HOME /opt/simple-spring-boot
ENV APP_USER simple-spring-boot

RUN adduser -h ${APP_HOME} -D ${APP_USER}


# add application jar.
ARG APP_JAR
ADD ${APP_JAR} ${APP_HOME}/


# make conf directory.
RUN mkdir -p ${APP_HOME}/conf

# add run shell.
ADD run.sh ${APP_HOME}/

# add permissions.
RUN chmod +x ${APP_HOME}/*.sh
RUN chown ${APP_USER}: -R ${APP_HOME}

# change work directory.
USER ${APP_USER}
WORKDIR ${APP_HOME}

ENTRYPOINT ["./run.sh"]