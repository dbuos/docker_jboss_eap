FROM centos:7
MAINTAINER Daniel Bustamante Ospina "dbustamante69@gmail.com"
RUN yum install -y wget && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
RUN rpm -ivh jdk-8u45-linux-x64.rpm && rm jdk-8u45-linux-x64.rpm
ADD jboss-eap-6.4.0-installer.jar ./
ADD auto.xml ./
ADD auto.xml.variables ./
RUN java -jar jboss-eap-6.4.0-installer.jar auto.xml -variablefile auto.xml.variables
RUN rm jboss-eap-6.4.0-installer.jar auto.xml
CMD /opt/jbossas/bin/domain.sh -bmanagement=0.0.0.0 -b 0.0.0.0
EXPOSE 9990 8080


