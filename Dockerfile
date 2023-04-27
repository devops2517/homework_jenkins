FROM maven:3.8.1-jdk-11

WORKDIR /usr/src/apptarget/

COPY pom.xml ./
RUN mvn -B -e -C -T 1C -DskipTests=true dependency:resolve

COPY src ./src
RUN mvn -B -e -o -C -T 1C clean package

ENTRYPOINT ["mvn", "jetty:run"]