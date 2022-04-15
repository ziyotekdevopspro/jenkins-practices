FROM java:8
COPY . /home/app
WORKDIR /home/app
#RUN javac HelloWorld.java
CMD ["java","HelloWorld"]
