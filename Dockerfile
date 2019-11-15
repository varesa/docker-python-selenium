FROM python:latest

ARG GECKODRIVER_URL=https://github.com/mozilla/geckodriver/releases/download/v0.26.0/geckodriver-v0.26.0-linux64.tar.gz
ARG DEBIAN_FRONTEND=noninteractive

RUN cd /tmp/ && \
    wget $GECKODRIVER_URL && \
    tar xvfz geckodriver* && \
    mv geckodriver /usr/bin/ && \
    rm -rf geckodriver*

RUN apt update && \
    apt install -y firefox-esr && \
    rm -rf /var/lib/apt/lists*

COPY . /install
RUN pip3 install -r /install/requirements.txt

