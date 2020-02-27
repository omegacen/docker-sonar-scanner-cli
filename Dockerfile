FROM sonarsource/sonar-scanner-cli:latest

LABEL maintainer="teake.nutma@gmail.com"
LABEL description="SonarScanner + other utils"

USER root

RUN apt update && apt-get install -y curl jq \
    && rm -rf /var/lib/apt/lists/*

USER scanner-cli
