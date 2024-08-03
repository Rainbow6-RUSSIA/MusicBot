#
# Build stage
#
FROM maven:3.9.7-amazoncorretto-21 AS build
WORKDIR /app
COPY src ./src
COPY pom.xml .
RUN mvn -f ./pom.xml clean package

#
# Package stage
#
FROM amazoncorretto:21-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar ./
COPY env_config.txt .
CMD ["java", "-Dconfig=env_config.txt", "-Dnogui=true", "-jar", "./JMusicBot-Snapshot-All.jar"]