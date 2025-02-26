FROM maven:3.9.9-eclipse-temurin-23-alpine AS builder

WORKDIR /usr/src/app

COPY . .

RUN mvn clean package

FROM tomcat:8.5

COPY --from=builder /usr/src/app/target/addressbook.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
