FROM java

RUN apt-get update && apt-get -y install \

    wget

RUN  mkdir -p /home/app/

RUN  wget -O /home/app/myapp.jar "http://mybrazilianrecipes.com/docker/my_app/myApp.jar"

EXPOSE 8080

CMD ["java","-jar","/home/app/myapp.jar"]