FROM openjdk:8-jre

MAINTAINER Matthew Schmidt <matthew.schmidtj@gmail.com>

ARG OTP_BASE
RUN apt-get update
RUN mkdir -p $OTP_BASE
RUN wget -O $OTP_BASE/otp.jar https://repo1.maven.org/maven2/org/opentripplanner/otp/1.2.0/otp-1.2.0-shaded.jar
ENTRYPOINT ["java", "-Xmx2G", "-jar", "/var/otp/otp.jar"]
