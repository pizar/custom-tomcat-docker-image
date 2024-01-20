# Starting from official image 7.0.56-jre7
FROM tomcat:7.0.56-jre7

# Move on tomcat dir
WORKDIR /usr/local/tomcat
USER tomcat

# Replace tomcat 7.0.56 with 7.0.54
ENV TOMCAT_VERSION=7.0.54
ENV TOMCAT_TGZ_URL=https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.54/bin/apache-tomcat-7.0.54.tar.gz
RUN curl -SL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz\
	&& curl -SL "$TOMCAT_TGZ_URL.asc" -o tomcat.tar.gz.asc\
	&& gpg --verify tomcat.tar.gz.asc\
	&& tar -xvf tomcat.tar.gz --strip-components=1\
	&& rm bin/*.bat\
	&& rm tomcat.tar.gz*