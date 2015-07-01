FROM centos:7
MAINTAINER Daniel Bustamante Ospina "dbustamante69@gmail.com"
RUN yum install -y wget && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
RUN rpm -ivh jdk-8u45-linux-x64.rpm && rm jdk-8u45-linux-x64.rpm
ADD auto.xml ./
ADD auto.xml.variables ./
RUN curl --header 'Host: access.cdn.redhat.com' --header 'User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'Accept-Language: es-ar,es;q=0.8,en-us;q=0.5,en;q=0.3' --header 'Referer: https://www.jboss.org/products/eap/get-started/?tcUser=Daniel+Bustamante+Ospina&tcWhenSigned=February+27%2C+2015&tcWhenEnds=February+27%2C+2016&tcEndsIn=240&tcDuration=365&tcDownloadFileName=jboss-eap-6.4.0-installer.jar&tcRedirect=5000&tcSrcLink=https%3A%2F%2Fwww.jboss.org%2Fdownload-manager%2Fcontent%2Forigin%2Ffiles%2Fsha256%2F36%2F363ab89d81b1f496da3e745f6cac7f9456d76bd4a9d1908c597f514232f84c0a%2Fjboss-eap-6.4.0-installer.jar&p=Enterprise+Application+Server&pv=6.4.0&tcDownloadURL=https%3A%2F%2Faccess.cdn.redhat.com%2Fcontent%2Forigin%2Ffiles%2Fsha256%2F36%2F363ab89d81b1f496da3e745f6cac7f9456d76bd4a9d1908c597f514232f84c0a%2Fjboss-eap-6.4.0-installer.jar%3F_auth_%3D1435791511_58f592af077d3cf2612dc870eacbfcf9' --header 'Cookie: s_vi=[CS]v1|2AC603BC851D56F9-60001904A00A4DBE[CE]; __utma=185718442.337185910.1435240331.1435240331.1435246116.2; __utmz=185718442.1435246116.2.2.utmcsr=jboss.org|utmccn=(referral)|utmcmd=referral|utmcct=/products/eap/get-started/; s_fid=650BCFB9A4CFAA5D-078826D88323EDE9; rh_omni_tc=70160000000dJVLAA2; s_nr=1435241184939; s_vnum=1437832333379%26vn%3D2; chrome_user_remember=%7B%22remembered%22%3Atrue%7D' --header 'Connection: keep-alive' 'https://access.cdn.redhat.com/content/origin/files/sha256/36/363ab89d81b1f496da3e745f6cac7f9456d76bd4a9d1908c597f514232f84c0a/jboss-eap-6.4.0-installer.jar?_auth_=1435791511_58f592af077d3cf2612dc870eacbfcf9#!project=eap' -o 'jboss-eap-6.4.0-installer.jar' -L \
  && java -jar jboss-eap-6.4.0-installer.jar auto.xml -variablefile auto.xml.variables \
  && rm jboss-eap-6.4.0-installer.jar auto.xml
#ADD jboss-eap-6.4.0-installer.jar ./
#RUN java -jar jboss-eap-6.4.0-installer.jar auto.xml -variablefile auto.xml.variables
##RUN rm jboss-eap-6.4.0-installer.jar auto.xml
CMD /opt/jbossas/bin/domain.sh -bmanagement=0.0.0.0 -b 0.0.0.0
EXPOSE 9990 8080 8443


