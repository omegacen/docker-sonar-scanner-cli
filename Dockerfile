FROM sonarsource/sonar-scanner-cli:4.4

LABEL maintainer="teake.nutma@gmail.com"
LABEL description="SonarScanner + other utils"

RUN apk add --no-cache curl jq \
    && pip install coverage-fixpaths
