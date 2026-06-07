FROM ubuntu:20.04

LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV DEBIAN_FRONTEND=noninteractive

# GoTTY install
RUN apt-get -y update && \
    apt-get install -y curl && \
    curl -sLk https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz \
    | tar xzC /usr/local/bin && \
    apt-get purge --auto-remove -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists*

# Python install
RUN apt-get -y update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists*

# Agar koi library pehle se chahiye toh yahan daal do
# RUN pip3 install pandas numpy requests flask

COPY run_gotty.sh /run_gotty.sh
RUN chmod 744 /run_gotty.sh

# Heroku $PORT use karta hai dynamically
CMD ["/bin/bash", "/run_gotty.sh"]