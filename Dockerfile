FROM openjdk:17

WORKDIR /my-app

COPY ./target/my-app.jar /my-app/my-app.jar

EXPOSE 8282

CMD [ "java", "-jar" "my-app.jar" ]