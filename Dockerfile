FROM dboss/docker-jboss-eap
MAINTAINER Aidelis Calvo "aidelis.lopez@techandsolve.com"
RUN yum clean all 
RUN yum install -y expect