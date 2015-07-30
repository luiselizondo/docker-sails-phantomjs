FROM servebox/phantomjs:latest
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get update --fix-missing
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get install -y \
	supervisor \
	python \
	nodejs \
	imagemagick \
	git \
	openssl \
	make \
	build-essential \
	gcc \
	ca-certificates

RUN cd /tmp ; \
	curl -O http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb ; \
	dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb ; \
	rm /tmp/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

RUN npm install -g npm@latest
RUN npm install -g \
	express-generator \
	bower \
	mocha \
	sinon \
	should \
	assert \
	grunt-cli \
	gulp \
	node-gyp \
	sails \
	wkhtmltopdf \
	phantomjs
	
RUN npm update
RUN apt-get update --fix-missing
RUN mkdir -p /var/log/supervisor

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get autoremove -y

ADD ./config/supervisord.conf /etc/supervisor/conf.d/supervisord-nodejs.conf

RUN ln -s /usr/bin/nodejs /usr/local/bin/node

WORKDIR /var/www

EXPOSE 1337
EXPOSE 3000

CMD ["/usr/bin/supervisord", "-n"]