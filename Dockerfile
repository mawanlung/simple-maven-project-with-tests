FROM anapsix/alpine-java 
LABEL maintainer="shanem@liatrio.com" 
COPY /target/simple-maven-project-with-tests.jar /home/simple-maven-project-with-tests.jar 
CMD ["java","-jar","/home/spring-petclinic-1.5.1.jar"]
