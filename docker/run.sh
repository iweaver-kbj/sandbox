#!/bin/sh

set -eux;

# run spring boot application.
java \
$JAVA_OPTS \
--add-opens jdk.naming.rmi/com.sun.jndi.rmi.registry=ALL-UNNAMED \
--add-opens java.base/java.lang=ALL-UNNAMED \
--add-opens java.base/java.util=ALL-UNNAMED \
--add-opens java.base/sun.nio.ch=ALL-UNNAMED \
--add-opens java.base/sun.security.action=ALL-UNNAMED \
--add-opens java.base/sun.net=ALL-UNNAMED \
-jar \
*.jar \
--spring.config.location=file:/opt/simple-spring-boot/conf/application.yml