# Usa una imagen de Maven con OpenJDK 17
FROM maven:3.8.6-openjdk-17 AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto
COPY . .

# Compila el proyecto con Maven
RUN mvn clean package -DskipTests

# Usa una imagen más ligera de OpenJDK para la ejecución
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo
WORKDIR /app

# Copia el JAR generado en la fase de compilación
COPY --from=build /app/target/*.jar app.jar

# Expone el puerto de la aplicación
EXPOSE 8080

# Ejecuta la aplicación
CMD ["java", "-jar", "app.jar"]
