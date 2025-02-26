#!/bin/bash
FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y wget && wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor && chmod +x cadvisor

CMD ["./cadvisor"]

