
# Pull base ubuntu image.
#FROM ubuntu:latest

#RUN \
#apt-get update -y && \
#apt-get install default-jre -y

FROM openjdk:latest

# Copy the build files to the container.
ADD ./gRPCTestProj/target/gRPCTestProj-1.0-SNAPSHOT-jar-with-dependencies.jar gRPCTestProj-1.0-SNAPSHOT-jar-with-dependencies.jar
# Document that the service listens on port 50051.
EXPOSE 50052
# Run the server command when the container starts.
CMD java -jar gRPCTestProj-1.0-SNAPSHOT-jar-with-dependencies.jar
