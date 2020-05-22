FROM mono:6.8

ADD mendix /opt/mendix

FROM openjdk:11-jdk

CMD [ "mono", "/opt/mendix/modeler/mxbuild.exe" ]