FROM openjdk
LABEL maintainer=mukesh@gmail.com
COPY /target/demo-0.0.1-SNAPSHOT.jar /home/nmmukesh97gmail/FinalProject/
ENTRYPOINT [ "java", "-jar", "/home/nmmukesh97gmail/FinalProject/demo-0.0.1-SNAPSHOT.jar"]

