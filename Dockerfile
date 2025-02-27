# Usa una imagen de Maven con OpenJDK 17
FROM maven:3.8.7-eclipse-temurin-17 AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto
COPY . .

# Construye la aplicación con Maven
RUN mvn clean package -DskipTests

# Cambia a una imagen más ligera de OpenJDK 17 para la ejecución
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el JAR generado
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto
EXPOSE 8080

# Iniciar la aplicación
CMD ["java", "-jar", "app.jar"]
