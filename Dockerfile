# syntax=docker/dockerfile:1

############################
# Stage 1: Build with Maven
############################
FROM maven:3.9.8-eclipse-temurin-17 AS build
WORKDIR /app

# Copy project và build
COPY pom.xml .
COPY src ./src
RUN mvn -B -DskipTests clean package

############################
# Stage 2: Run on Tomcat 11
############################
FROM tomcat:11.0-jdk17-temurin

ENV TZ=Asia/Ho_Chi_Minh
# (tuỳ chọn) dọn webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Đặt WAR thành ROOT.war => context path = "/"
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Một số options gọn nhẹ + UTF-8
ENV CATALINA_OPTS="-Dfile.encoding=UTF-8 -Djava.awt.headless=true -Xms128m -Xmx256m"

EXPOSE 8080
CMD ["catalina.sh", "run"]
