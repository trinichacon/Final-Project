FROM maven:latest
ENV APP_HOME=/app/

COPY pom.xml $APP_HOME
COPY src $APP_HOME/src/
WORKDIR $APP_HOME

RUN mvn package -DskipTests
ENV JAR_FILE=target/my-app-1.0-SNAPSHOT.jar
COPY ${JAR_FILE} /app.jar

EXPOSE 8300

ENTRYPOINT ["java", "-jar", "/app.jar"]

