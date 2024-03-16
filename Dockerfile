# Use an official Maven runtime as a parent image
FROM maven:3.9.6 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Build the application
RUN mvn clean package

# Use OpenJDK for running the webapp
FROM openjdk:21

# Copy the built jar file from the build stage
COPY --from=build /app/target/COMP367_lab2_Maven-0.0.1-SNAPSHOT.jar /usr/app/COMP367_lab2_Maven-0.0.1-SNAPSHOT.jar

# Set the working directory for any subsequent instructions
WORKDIR /usr/app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "COMP367_lab2_Maven-0.0.1-SNAPSHOT.jar"]

