FROM ubuntu:15.10
MAINTAINER Stephen Olesen <slepp@slepp.ca>

RUN apt-get update \
	&& apt-get install -y \
		git \
		make \
		gcc \
		ant \
		openjdk-8-jdk \
		xvfb \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/share

RUN git clone https://github.com/arduino/Arduino.git
#	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION} /usr/local/share/arduino \
#	&& ln -s /usr/local/share/arduino-${ARDUINO_IDE_VERSION}/arduino /usr/local/bin/arduino)

COPY ./start-xvfb.sh /usr/local/bin/start-xvfb

ENV DISPLAY :1.0

COPY ./start-session.sh /usr/local/bin/start-session

CMD ["/bin/bash"]

ENTRYPOINT ["/usr/local/bin/start-session"]
