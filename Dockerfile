FROM index.xxxxx.com/library/ubuntu:14.04

RUN mkdir /app
COPY ./ /app
WORKDIR /app

EXPOSE 8125/udp

CMD ["/app/run.sh", "telegraf"]
