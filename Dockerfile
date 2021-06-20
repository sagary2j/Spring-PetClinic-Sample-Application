FROM openjdk:8-jdk-alpine
LABEL maintainer="sagar.rav89@gmail.com"
ADD target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar","/app.jar"]