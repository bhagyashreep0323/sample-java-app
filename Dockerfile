FROM maven:3.8.6-eclipse-temurin-17 as build

WORKDIR /app

# Clone the source code
RUN git clone https://github.com/bhagyashreep0323/sample-java-app.git .

# Build the app
RUN mvn clean package

# Runtime image
FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
