# Usar una imagen base de OpenJDK
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo
WORKDIR /app

# Expone el puerto donde tu aplicación escuchará
EXPOSE 8080

# Copia el archivo JAR de tu aplicación al contenedor
ADD ./target/demo-0.0.1-SNAPSHOT.jar demo.jar

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "/app/demo.jar"]