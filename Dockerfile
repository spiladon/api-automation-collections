FROM alpine:latest

RUN apk add --update npm
WORKDIR /etc/newman/

COPY examples/newman_example.json /etc/newman/

RUN npm install -g newman
RUN npm install -g npm@8.18.0
RUN npm install -g newman-reporter-allure

EXPOSE 8080

RUN newman --help
RUN newman run newman_example.json -r allure
CMD [ "ls", "-la", "allure-results"]