#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
WORKDIR /app
COPY src ./src
COPY pom.xml .
RUN mvn -f ./pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/*.jar ./
COPY start.sh .
RUN chmod +x ./start.sh
CMD "./start.sh"