# Usar una imagen base de OpenJDK con Maven
FROM maven:3.9.0-openjdk-17-slim AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo pom.xml y el directorio src para la construcción
COPY pom.xml .
COPY src ./src

# Compila la aplicación usando Maven
RUN ./mvnw package -DskipTests

# Usar una imagen base de OpenJDK para la ejecución
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo JAR generado desde la etapa de construcción
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar demo.jar

# Expone el puerto donde tu aplicación escuchará
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "demo.jar"]