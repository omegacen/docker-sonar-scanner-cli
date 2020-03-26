FROM sonarsource/sonar-scanner-cli:latest

LABEL maintainer="teake.nutma@gmail.com"
LABEL description="SonarScanner + other utils"

USER root

ENV LANG=C.UTF-8

RUN apt update && apt-get install -y curl jq xmlstarlet python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    # We can't use the latest pylint and astroid releases because those have an infinite recursion bug.
    # So we'll just grab the (at the time of writing) latest commits of the master branches.
    && pip3 install git+git://github.com/PyCQA/astroid.git@ab9d147d71c3dff39972b7d2173aa66a616ff5b7 \
    && pip3 install git+git://github.com/PyCQA/pylint.git@2da80557b7c02f52030f1b4ac8f78838126416c2

USER scanner-cli
