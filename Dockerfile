FROM resin/raspberrypi3-debian:stretch

LABEL io.resin.device-type="raspberrypi3"

RUN echo "deb http://archive.raspbian.org/raspbian stretch main contrib non-free rpi firmware" >>  /etc/apt/sources.list \
	&& apt-key adv --keyserver pgp.mit.edu  --recv-key 0x9165938D90FDDD2E

RUN apt-get update && apt-get install -y --no-install-recommends \
		libraspberrypi-bin \
		less \
		kmod \
		vim \
		net-tools \
		ifupdown \
		iputils-ping \
		i2c-tools \
		usbutils \
	&& rm -rf /var/lib/apt/lists/*

ENV INITSYSTEM on
