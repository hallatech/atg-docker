# Build JDK images

- Download and accept license for Oracle JDK8 into this directory
- Execute `docker build -t hallatech/jdk8:latest .`
- Run `docker run -it --name jdk8 hallatech/jdk8 bash`
- `bash-4.2# $JAVA_HOME/bin/java -version`

