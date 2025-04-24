FROM ubuntu AS clone
WORKDIR /app
RUN git clone https://github.com/bhagyashreep032/docker-sample-java-webapp.git .

FROM maven AS build
WORKDIR /app
COPY --from=clone /app /app
RUN mvn clean package

FROM openjdk
WORKDIR /app
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
