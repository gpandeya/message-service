FROM gradle:6.3.0-jdk8 as build

WORKDIR /app

# COPY build/libs/*.jar /app/message-service.jar

# ENTRYPOINT ["java" ,"-jar","message-service.jar"]

COPY build.gradle .
COPY gradlew .
COPY settings.gradle .

RUN chmod +x ./gradlew

COPY src src
COPY gradle gradle

RUN gradle build
 
RUN mkdir -p build/libs && (cd build/libs; jar -xf *.jar)

# Production Stage for Spring boot application image
FROM openjdk:8-jre-alpine as production
ARG DEPENDENCY=/app/build/libs

# Copy the dependency application file from build stage artifact
COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

# Run the Spring boot application
ENTRYPOINT ["java", "-cp", "app:app/lib/*","com.gp.learn.basic.messageservice.MessageServiceApplication"]