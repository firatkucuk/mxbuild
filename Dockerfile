FROM mono:6.8

ADD mendix /opt/mendix

RUN apt-get update \
  && apt-get install -y --no-install-recommends wget \
  && rm -rf /var/lib/apt/lists/* \
  && wget -q https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.7%2B10/OpenJDK11U-jdk_x64_linux_hotspot_11.0.7_10.tar.gz \
  && tar xzf OpenJDK11U-jdk_x64_linux_hotspot_11.0.7_10.tar.gz \
  && rm -f OpenJDK11U-jdk_x64_linux_hotspot_11.0.7_10.tar.gz \
  && mv jdk-11.0.7+10 /opt/jdk-11 \
  && apt-get purge -y --auto-remove wget

ENV JAVA_HOME /opt/jdk-11
ENV PATH $JAVA_HOME/bin:$PATH

CMD [ "mono", "/opt/mendix/modeler/mxbuild.exe" ]