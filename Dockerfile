FROM maven:3.6.0-jdk-11
LABEL authors = "muniz"

WORKDIR /build

COPY . .

RUN mvn clean package -DskipTests - Dcheckstyle.skip=true

FROM openjdk:17-slim

WORKDIR /app

COPY --from=builder /build/target/*.jar /app/app.jar

CMD ["java", "-jar", "app.jar"]
