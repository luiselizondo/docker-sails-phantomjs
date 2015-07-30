FROM luis/phantomjs
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

RUN npm install -g sails
RUN npm install -g wkhtmltopdf phantomjs

EXPOSE 1337
EXPOSE 3000

CMD ["/usr/bin/supervisord", "-n"]
