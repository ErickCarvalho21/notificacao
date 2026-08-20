FROM gradle:8.14-jdk17 AS BUILD

WORKDIR /app

COPY . .

RUN gradle clean build --no-daemon

FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY --from=BUILD /app/build/libs/*.jar /app/notificacao.jar

EXPOSE 8083

CMD ["java", "-jar", "/app/notificacao.jar"]