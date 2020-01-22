FROM centos

yum install java git wget -y
WORKDIR /home/centos/
COPY /root/.jenkins/workspace/emexo_app/target/emexo_app-1.0-SNAPSHOT.jar ~



