# Padn't

This is a fork of [Baioc's Padn't](https://github.com/baioc/padnt)
Thanks [@baioc](https://github.com/baioc) for this amazing repo!

[Padn't](https://padnt.azurewebsites.net/) is a [Dontpad](https://dontpad.com/) clone implemented with Java Spring Boot.

<br/>
<picture>
  <source srcset="https://user-images.githubusercontent.com/27034173/221334819-a09ff5c2-8df0-400e-895c-eee96c95dd9c.png" media="(prefers-color-scheme: dark)" alt="padnt-index-transparent-darkmode" />
  <img src="https://user-images.githubusercontent.com/27034173/221334818-390a15a5-1b76-4d0c-be84-8093290e9b1e.png" alt="padnt-index-transparent" />
</picture>
<br/>
<br/>


## Starting the dockerized server

build the app
```
mvn clean package
```

```sh
docker compose up -d --build
```

Dockerfile
```Dockerfile
FROM openjdk:24-oraclelinux9
MAINTAINER baeldung.com
COPY target/padnt-0.2.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
```

docker-compose.yml
```yml
services:
  message-server:
    image: padnt:1.0.0
    build:
      context: .
    ports:
      - "8080:8080"
    volumes:
      - ./logs:/logs/tomcat         # Persist Tomcat logs
      - ./database:/database
    restart: always
    container_name: padnt
```

### Environment variables

Name | Value
---|---
`SERVER_PORT` | `8080` |
`LOGGING_LEVEL_ROOT` | `INFO` |
`LOGGING_LEVEL_BAIOC_PADNT` | `${LOGGING_LEVEL_ROOT}` |
`JAVA_OPTS` | `''` |

NOTE: `JAVA_OPTS` can be used to override anything else on [application.properties](src/main/resources/application.properties), for instance.
