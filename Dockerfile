FROM maven:3.6.3-jdk-8-slim

WORKDIR /app

COPY . .

RUN mvn package

CMD ["java", "-jar", "target/nanotwitter.jar"]