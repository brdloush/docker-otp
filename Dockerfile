FROM openjdk:19-jdk-alpine3.16
LABEL maintainer="Tomas Brejla <brdloush@gmail.com>"

ENV OTP_VERSION=1.5.0
ENV JAVA_OPTIONS=-Xmx1G

RUN mkdir /opt/otp

ADD https://repo1.maven.org/maven2/org/opentripplanner/otp/1.5.0/otp-1.5.0-shaded.jar /opt/otp/
ADD https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.3/jython-standalone-2.7.3.jar /opt/otp/
ADD otp /opt/otp/

RUN ln -s /opt/otp/otp-1.5.0-shaded.jar /opt/otp/otp.jar

COPY otp /usr/local/bin/

EXPOSE 8080

WORKDIR /opt/otp

ENTRYPOINT ["otp"]
CMD ["--help"]