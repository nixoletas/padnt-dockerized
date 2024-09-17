FROM openjdk:24-oraclelinux9
MAINTAINER baeldung.com
COPY target/padnt-0.2.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]