# Pull base ubuntu image.
FROM ubuntu:devel

RUN apt-get update && apt-get clean && rm -rf /var/lib/apt/lists/*

#RUN \
#apt-get update -y && \
#apt-get install default-jre -y

# Install OpenJDK-11
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get clean;

# Copy the build files to the container.
ADD ./gRPCTestProj/target/gRPCTestProj-1.0-SNAPSHOT-jar-with-dependencies.jar gRPCTestProj-1.0-SNAPSHOT-jar-with-dependencies.jar
# Document that the service listens on port 50051.
EXPOSE 50052
# Run the server command when the container starts.
CMD java -jar gRPCTestProj-1.0-SNAPSHOT-jar-with-dependencies.jar
