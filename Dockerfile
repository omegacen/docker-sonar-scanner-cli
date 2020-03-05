FROM sonarsource/sonar-scanner-cli:latest

LABEL maintainer="teake.nutma@gmail.com"
LABEL description="SonarScanner + other utils"

USER root

RUN apt update && apt-get install -y curl jq python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install pylint

USER scanner-cli
