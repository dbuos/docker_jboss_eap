FROM dboss/docker-jboss-eap
MAINTAINER Daniel Bustamante Ospina "dbustamante69@gmail.com"
RUN yum install -y expect
ADD conf ./
RUN chmod +x /configure_jboss.sh
RUN /configure_jboss.sh
#ADD jboss-eap-6.4.0-installer.jar ./
#RUN java -jar jboss-eap-6.4.0-installer.jar auto.xml -variablefile auto.xml.variables
##RUN rm jboss-eap-6.4.0-installer.jar auto.xml
#CMD /opt/jbossas/bin/domain.sh -bmanagement=0.0.0.0 -b 0.0.0.0
#EXPOSE 9990 8080 8443


