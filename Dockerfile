# syntax=docker/dockerfile:1

############################
# Stage 1: Build with Maven
############################
FROM maven:3.9.8-eclipse-temurin-17 AS build
WORKDIR /app

# copy project and build
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests clean package

############################
# Stage 2: Run on Tomcat 11
############################
FROM tomcat:11.0-jdk17-temurin

# múi giờ tuỳ chọn
ENV TZ=Asia/Ho_Chi_Minh

# (tuỳ chọn) dọn webapps mặc định cho sạch
RUN rm -rf /usr/local/tomcat/webapps/*

# copy WAR đã build và đặt context path là /bai7
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/bai7.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
