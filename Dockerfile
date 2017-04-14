FROM alpine:3.5

RUN apk add --no-cache git python py-pip gcc python-dev py-twisted musl-dev py-cffi py-openssl gmp-dev mpfr-dev mpc1-dev
RUN adduser -D -s /bin/sh cowrie cowrie

USER cowrie
RUN git clone https://github.com/micheloosterhof/cowrie.git /home/cowrie/cowrie
RUN cd /home/cowrie/cowrie && pip install -r requirements.txt --user

COPY cowrie.cfg /home/cowrie/cowrie
COPY cowrie-docker /home/cowrie/cowrie

USER root
RUN chmod 755 /home/cowrie/cowrie/cowrie-docker

USER cowrie
EXPOSE 2222
ENTRYPOINT ["/home/cowrie/cowrie/cowrie-docker"]
